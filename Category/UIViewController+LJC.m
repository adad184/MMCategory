//
//  UIViewController+LJC.m
//  Track66
//
//  Created by Ralph Li on 13-3-7.
//  Copyright (c) 2013年 LJC. All rights reserved.
//

#import "UIViewController+LJC.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIViewController (LJC)

+ (UIViewController *)topViewController:(UIViewController *)rootViewController
{
    if (rootViewController.presentedViewController == nil) {
        return rootViewController;
    }
    
    if ([rootViewController.presentedViewController isMemberOfClass:[UINavigationController class]]) {
        UINavigationController *navigationController = (UINavigationController *)rootViewController.presentedViewController;
        UIViewController *lastViewController = [[navigationController viewControllers] lastObject];
        return [self topViewController:lastViewController];
    }
    
    UIViewController *presentedViewController = (UIViewController *)rootViewController.presentedViewController;
    return [self topViewController:presentedViewController];
}

@end
