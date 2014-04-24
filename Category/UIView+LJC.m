//
//  UIView+LJC.m
//  magicPhoto
//
//  Created by  on 12-1-13.
//  Copyright (c) 2012年 LJC. All rights reserved.
//

#import "UIView+LJC.h"
#import "UIColor+LJC.h"
#import "UIImage+LJC.h"
#import <QuartzCore/QuartzCore.h>
#import <objc/runtime.h>

@implementation UIView (LJC)

- (float)x
{
    return self.frame.origin.x;
}
- (float)y
{
    return self.frame.origin.y;
}
- (float)w
{
    return self.frame.size.width;
}
- (float)h
{
    return self.frame.size.height;
}

- (void)setTagName:(NSString*)name
{
    self.tag = [name hash];
}

- (UIView *)viewWithName:(NSString *)name
{
    return [self viewWithTag:[name hash]];
}

- (void)addToolbar:(UIView *)toolbar
{
    toolbar.frame = CGRectMake(0
                               , self.frame.size.height-toolbar.frame.size.height
                               , toolbar.frame.size.width
                               , toolbar.frame.size.height);
    [toolbar setAutoresizingMask:FixedMarginB];
    [self addSubview:toolbar];
}

- (void)setPosition:(CGRect)position
{
    self.bounds = CGRectMake(0, 0, position.size.width, position.size.height);
    self.center = CGPointMake(position.origin.x,position.origin.y);
}

+ (UIImageView *) viewWithColor:(UIColor*)color
{
    return [[UIImageView alloc] initWithImage:[UIImage imageWithColor:color]];
}

- (UIView *) getFirstResponder
{
    if (self.isFirstResponder) {
        return self;
    }
    
    for (UIView *subView in self.subviews) {
        UIView *firstResponder = [subView getFirstResponder];
        if (firstResponder != nil) {
            return firstResponder;
        }
    }
    
    return nil;
}

- (BOOL)haveSubview:(UIView*)subView
{
    UIView *v = subView;
    
    while (v)
    {
        if ( self == v )
        {
            return YES;
        }
        
        v = v.superview;
    }
    
    return NO;
}

- (void)setRoundedCornersRadius:(CGFloat)radius
{
    [self setRoundedCorners:UIRectCornerAllCorners radius:radius];
}

- (void)setRoundedCorners:(UIRectCorner)corners radius:(CGFloat)radius
{
	CGRect rect = self.bounds;
    
    // Create the path
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:rect
                                                   byRoundingCorners:corners
                                                         cornerRadii:CGSizeMake(radius, radius)];
    
    // Create the shape layer and set its path
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = rect;
    maskLayer.path = maskPath.CGPath;
    
    // Set the newly created shape layer as the mask for the view's layer
    self.layer.mask = maskLayer;
}

- (void)setShadowRadius:(CGFloat)radius
{
    [self setShadowCorners:UIRectCornerAllCorners radius:radius];
}

- (void)setShadowCorners:(UIRectCorner)corners radius:(CGFloat)radius
{
	CGRect rect = self.bounds;
    
    
    self.layer.shadowRadius = 2.0f;
    self.layer.shadowColor = [UIColor darkGrayColor].CGColor;
    self.layer.shadowOffset = CGSizeMake(1.0f, 1.0f);
    self.layer.shadowOpacity = 1.0f;
    self.layer.shadowPath = [[UIBezierPath bezierPathWithRoundedRect:rect
                                                   byRoundingCorners:corners
                                                         cornerRadii:CGSizeMake(radius, radius)] CGPath];
}

- (void)pauseAnimation
{
    NSFUNC;
    CALayer *layer = self.layer;
    CFTimeInterval pausedTime = [layer convertTime:CACurrentMediaTime() fromLayer:nil];
    layer.speed = 0.0;
    layer.timeOffset = pausedTime;
}

- (void)resumeAnimation
{
    NSFUNC;
    CALayer *layer = self.layer;
//    [layer addAnimation:[APP rotateAnimation] forKey:@"rotate"];
    CFTimeInterval pausedTime = [layer timeOffset];
    layer.speed = 1.0;
    layer.timeOffset = 0.0;
    layer.beginTime = 0.0;
    CFTimeInterval timeSincePause = [layer convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime;
    layer.beginTime = timeSincePause;
}

@end
