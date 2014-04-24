//
//  TSViewController.m
//  taishop
//
//  Created by Ralph Li on 12/27/13.
//  Copyright (c) 2013 taishop. All rights reserved.
//

#import "MMViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface MMViewController ()

@property (nonatomic, strong) UIView *statusView;
@property (nonatomic, strong) UIView *statusCenterView;;
@property (nonatomic, strong) UILabel *labelStatus;
@property (nonatomic, strong) UIButton *btnStatus;
@property (nonatomic, strong) UIActivityIndicatorView *indicatorStatus;

@end

@implementation MMViewController

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
        
        LLLog(@"%@ init",NSStringFromClass(self.class));
        
        self.isFirstLoaded = YES;
        
        self.title = NSStringFromClass([self class]);
        self.hidesBottomBarWhenPushed = YES;
        self.view.backgroundColor = [UIColor colorWithHex:0xE6E6E6FF];
        self.contentView = [[UIView alloc] initWithFrame:self.view.bounds];
        self.contentView.autoresizingMask = FixedALL;
        [self.view addSubview:self.contentView];
        
        self.statusView = [[UIView alloc] initWithFrame:self.contentView.bounds];
        self.statusView.backgroundColor = self.view.backgroundColor;
        self.statusView.autoresizingMask = FixedALL;
        [self.contentView addSubview:self.statusView];
        
        
        self.statusCenterView = [[UIView alloc] initWithFrame:CGRectZero];
        [self.statusCenterView setPosition:CGRectMake(self.statusView.center.x, self.statusView.center.y,320, 80)];
        self.statusCenterView.autoresizingMask = FixedCenter;
        [self.statusView addSubview:self.statusCenterView];
//        self.statusCenterView.backgroundColor = [UIColor orangeColor];
        
        self.labelStatus = [UILabel pureLabelWithFrame:CGRectMake(0, 0, self.statusCenterView.w, self.statusCenterView.h/2)];
        self.labelStatus.numberOfLines = 0;
        self.labelStatus.textAlignment = NSTextAlignmentCenter;
        self.labelStatus.textColor = [UIColor darkGrayColor];
        [self.statusCenterView addSubview:self.labelStatus];
        
        self.btnStatus = [UIButton buttonWithType:UIButtonTypeCustom];
        self.btnStatus.frame = CGRectMake(self.statusCenterView.w/3, self.statusCenterView.h/2, self.statusCenterView.w/3, self.statusCenterView.h/2);
        [self.btnStatus setTitle:@"重试" forState:UIControlStateNormal];
        [self.btnStatus setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithHex:0xE52A04FF]] forState:UIControlStateNormal];
        [self.btnStatus setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithHex:0xA41B05FF]] forState:UIControlStateHighlighted];
        [self.statusCenterView addSubview:self.btnStatus];
        self.btnStatus.layer.cornerRadius = 5.0f;
        self.btnStatus.layer.masksToBounds = YES;
        
        
        self.indicatorStatus = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        self.indicatorStatus.center = self.btnStatus.center;
        self.indicatorStatus.hidesWhenStopped = YES;
        [self.statusCenterView addSubview:self.indicatorStatus];
        
        self.statusView.hidden = YES;
        
        [self setViewStatus:MMViewStatusTypeLoaded];
        
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if( [self respondsToSelector:@selector(setEdgesForExtendedLayout:)] )
    {
        self.edgesForExtendedLayout=UIRectEdgeNone;
        self.extendedLayoutIncludesOpaqueBars=NO;
        self.automaticallyAdjustsScrollViewInsets=NO;
    }
    
	// Do any additional setup after loading the view.
    if ( [self respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)] )
    {
        //        [self setNeedsStatusBarAppearanceUpdate];
    }
    
    [self.view layoutSubviews];
}


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(actionKeyboardShow:)
                                                 name:UIKeyboardDidShowNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(actionKeyboardHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

- (void)viewWillAppear:(BOOL)animated
{
    //    NSFUNC;
    
    APP.presentingController = self;
    
    if ( self.navigationController.viewControllers.count == 1 )
    {
        if ( self.showDismissButton )
        {
            [self setBackButton];
        }
    }
    
    if ( self.navigationController.viewControllers.count > 1 )
    {
        [self setBackButton];
    }
}

- (void)setBackButton
{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithTarget:self
                                                                              action:@selector(actionBack)
                                                                                imgN:@"res/common/button_back_N.png"
                                                                                imgH:@"res/common/button_back_H.png"
                                                                               title:@"  返回"];
}

- (void)actionBack
{
    self.isPoppingOut = YES;
    
    if ( self.showDismissButton )
    {
        [self dismissController];
    }
    else
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (BOOL)prefersStatusBarHidden
{
    return NO;
}

- (void)pushController:(UIViewController *)vc
{
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)popController
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)presentController:(UIViewController *)vc
{
    if ( [vc isKindOfClass:[MMViewController class]] )
    {
        MMViewController *gvc = (MMViewController*)vc;
        gvc.showDismissButton = YES;
    }
    
    if ( [vc isKindOfClass:[UINavigationController class]] )
    {
        [self presentViewController:vc animated:YES completion:^{
            
        }];
        return;
    }
    
    MMNavController *nav = [[MMNavController alloc] initWithRootViewController:vc];
    //    RCNavigationController *nav = [[RCNavigationController alloc] initWithRootViewController:vc];
    //    nav.modalPresentationStyle = UIModalPresentationPageSheet;
    //    nav.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    
    [self presentViewController:nav animated:YES completion:^{
        
    }];
    
}

- (void)dismissController
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)actionKeyboardShow:(NSNotification *)notification
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidChangeFrameNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(actionKeyboardShow:)
                                                 name:UIKeyboardDidChangeFrameNotification
                                               object:nil];
    
    
    CGSize keyboardSize = [[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    self.contentView.frame = CGRectMake(0, 0, [UIApplication currentSize].width, self.view.h-keyboardSize.height);
}

- (void)actionKeyboardHide:(NSNotification *)notification
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidChangeFrameNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(actionKeyboardShow:)
                                                 name:UIKeyboardDidShowNotification
                                               object:nil];
    
    self.contentView.frame = self.view.bounds;

}

- (void)setViewStatusTarget:(id)target action:(SEL)action
{
    [self.btnStatus addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
}

- (void)setViewStatusType:(MMViewStatusType)type msg:(NSString *)msg
{
    [self.contentView bringSubviewToFront:self.statusView];
    
    self.viewStatus = type;
    
    self.labelStatus.text = msg;
    
    switch (type) {
        case MMViewStatusTypeLoaded:
        {
            self.statusView.hidden = YES;
            [self.indicatorStatus stopAnimating];
            break;
        }
        case MMViewStatusTypeRetry:
        {
            self.statusView.hidden = NO;
            self.btnStatus.hidden = NO;
            [self.indicatorStatus stopAnimating];
            break;
        }
        case MMViewStatusTypeLoading:
        {
            self.statusView.hidden = NO;
            self.btnStatus.hidden = YES;
            [self.indicatorStatus startAnimating];
            break;
        }
        case MMViewStatusTypeFailed:
        {
            self.statusView.hidden = NO;
            self.btnStatus.hidden = YES;
            [self.indicatorStatus stopAnimating];
            break;
        }
            
        default:
            break;
    }
}


@end
