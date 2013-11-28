//
//  UIViewController+LJC.h
//  LJC
//
//  Created by Ralph Li on 13-3-7.
//  Copyright (c) 2013年 LJC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (LJC)

@property (assign, nonatomic) BOOL pushBackState;

// sample1
-(void) animationPopFront;
-(void) animationPushBack;

// sample2
-(void) animationPopFrontScaleUp;
-(void) animationPushBackScaleDown;

+ (UIViewController *)topViewController:(UIViewController *)rootViewController;

@end
