//
//  TSNavController.m
//  taishop
//
//  Created by Ralph Li on 12/30/13.
//  Copyright (c) 2013 taishop. All rights reserved.
//

#import "MMNavController.h"

#import <QuartzCore/QuartzCore.h>

#pragma mark - Vendor Category
@implementation UIView (Sceenshot)
- (UIImage *)imageFromView
{
    // Create a graphics context with the target size
    // On iOS 4 and later, use UIGraphicsBeginImageContextWithOptions to take the scale into consideration
    // On iOS prior to 4, fall back to use UIGraphicsBeginImageContext
    CGSize imageSize = [self bounds].size;
    if (NULL != UIGraphicsBeginImageContextWithOptions)
        UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0);
    else
        UIGraphicsBeginImageContext(imageSize);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // -renderInContext: renders in the coordinate space of the layer,
    // so we must first apply the layer's geometry to the graphics context
    CGContextSaveGState(context);
    // Center the context around the view's anchor point
    CGContextTranslateCTM(context, [self center].x, [self center].y);
    // Apply the view's transform about the anchor point
    CGContextConcatCTM(context, [self transform]);
    // Offset by the portion of the bounds left of and above the anchor point
    CGContextTranslateCTM(context,
                          -[self bounds].size.width * [[self layer] anchorPoint].x,
                          -[self bounds].size.height * [[self layer] anchorPoint].y);
    
    // Render the layer hierarchy to the current context
    [[self layer] renderInContext:context];
    
    // Restore the context
    CGContextRestoreGState(context);
    
    // Retrieve the screenshot image
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}
@end
#define VIEW_WIDTH UIApplication.currentSize.width
#define IMAGE_SCALE 0.9
#define DEFAULT_ALPHA .7

@interface MMNavController ()
{
    // setup gesture once when push for every instance
    dispatch_once_t onceToken;
    
    CGPoint _beginCenter;
}

// for all viewcontrollers' screenshot
@property (nonatomic, strong) NSMutableArray *preViewImages;
// the imageview while animation
@property (nonatomic, strong) UIImageView *preViewImageView;
@property (nonatomic, strong) UIView *alphaView;

@end

@implementation MMNavController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // disable iOS7 swipe gesture
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)])
    {
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    self.delegate = self;
}

#pragma mark - Pan pop
- (void)setupGestureIfNeed {
    dispatch_once(&onceToken, ^{
        UIPanGestureRecognizer *panPopGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
        panPopGesture.delegate = self;
        [self.view addGestureRecognizer:panPopGesture];
        
        _preViewImages = [NSMutableArray array];
    });
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if (self.disablePanPop) return NO;
    if (self.preViewImages.count == 0) return NO;
    
    UIViewController<MMNavigationDelegate> *delegate =
    [[self.visibleViewController class] conformsToProtocol:@protocol(MMNavigationDelegate)] ?
    (UIViewController<MMNavigationDelegate> *)self.visibleViewController : nil;
    
    if ([delegate respondsToSelector:@selector(disablePanPopAtPoint:)]) {
        CGPoint loc = [gestureRecognizer locationInView:delegate.view];
        return ![delegate disablePanPopAtPoint:loc];
    }
    
    return YES;
}

- (void)handlePan:(UIPanGestureRecognizer *)panGesture {
    switch (panGesture.state)
    {
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateFailed:
        case UIGestureRecognizerStatePossible:
        {
            break;
        }
        case UIGestureRecognizerStateEnded:
        {
            CGPoint p = [panGesture translationInView:self.view];
            
            CGFloat viewWidth = self.view.frame.size.width;
            CGFloat velocityX = [panGesture velocityInView:self.view].x;
            BOOL popTriggered = (p.x + velocityX*0.2) > viewWidth/2.0;
            if (popTriggered) {
                UIViewController<MMNavigationDelegate> *delegate =
                [self.visibleViewController conformsToProtocol:@protocol(MMNavigationDelegate)] ?
                (UIViewController<MMNavigationDelegate> *)self.visibleViewController : nil;
                
                if ([delegate respondsToSelector:@selector(navigationControllerTriggeredPop:)]) {
                    [delegate navigationControllerTriggeredPop:self];
                }
                NSTimeInterval duration = MIN((viewWidth-p.x) / velocityX, 0.2);
                [UIView animateWithDuration:duration animations:^{
                    panGesture.view.center = CGPointMake(_beginCenter.x + VIEW_WIDTH, _beginCenter.y);
                    self.preViewImageView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1, 1);
                    self.alphaView.alpha = 0;
                } completion:^(BOOL finished) {
                    panGesture.view.center = _beginCenter;
                    
                    if ([delegate respondsToSelector:@selector(navigationControllerWillPop:)]) {
                        [delegate navigationControllerWillPop:self];
                    }
                    [self popViewControllerAnimated:NO];
                    if ([delegate respondsToSelector:@selector(navigationControllerDidPop:)]) {
                        [delegate navigationControllerDidPop:self];
                    }
                    [self.preViewImageView removeFromSuperview];
                    [self.alphaView removeFromSuperview];
                    self.preViewImageView = nil;
                    self.alphaView = nil;
                }];
            } else {
                [UIView animateWithDuration:.3 animations:^{
                    panGesture.view.center = _beginCenter;
                    self.preViewImageView.transform = CGAffineTransformScale(CGAffineTransformIdentity, IMAGE_SCALE, IMAGE_SCALE);
                    self.alphaView.alpha = DEFAULT_ALPHA;
                } completion:^(BOOL finished) {
                    [self.preViewImageView removeFromSuperview];
                    [self.alphaView removeFromSuperview];
                    self.preViewImageView = nil;
                    self.alphaView = nil;
                }];
            }
            
            break;
        }
        case UIGestureRecognizerStateBegan:
        {
            _beginCenter = panGesture.view.center;
            
            self.preViewImageView = [[UIImageView alloc] initWithImage:self.preViewImages.lastObject];
            self.preViewImageView.frame = self.view.frame;
            self.alphaView = [[UIView alloc] initWithFrame:self.preViewImageView.frame];
            self.alphaView.backgroundColor = [UIColor blackColor];
            [self.view.superview insertSubview:self.preViewImageView belowSubview:self.view];
            [self.view.superview insertSubview:self.alphaView aboveSubview:self.preViewImageView];
            
            break;
        }
        case UIGestureRecognizerStateChanged:
        default:
        {
            CGPoint p = [panGesture translationInView:self.view];
            if (p.x > 0) {
                CGFloat scale = (1.0 - IMAGE_SCALE) / VIEW_WIDTH * p.x + IMAGE_SCALE;
                self.preViewImageView.transform = CGAffineTransformScale(CGAffineTransformIdentity, scale, scale);
                panGesture.view.center = CGPointMake(_beginCenter.x + p.x, _beginCenter.y);
                self.alphaView.alpha = DEFAULT_ALPHA - DEFAULT_ALPHA / VIEW_WIDTH * p.x;
            }
            
            break;
        }
    }
}

#pragma mark - Override
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        [self setupGestureIfNeed];
        
        UIImage *image = [APP.window imageFromView];
        [self.preViewImages addObject:image];
    }
    
    self.disablePanPop = YES;
    
    [super pushViewController:viewController animated:animated];
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    self.disablePanPop = NO;
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated {
    [self.preViewImages removeLastObject];
    return [super popViewControllerAnimated:animated];
}

- (NSArray *)popToRootViewControllerAnimated:(BOOL)animated {
    [self.preViewImages removeAllObjects];
    return [super popToRootViewControllerAnimated:animated];
}

- (NSArray *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated {
    NSArray *array = [super popToViewController:viewController animated:animated];
    [self.preViewImages removeObjectsInRange:NSMakeRange(self.viewControllers.count-1, array.count)];
    return array;
}

@end


