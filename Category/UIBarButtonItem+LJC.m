//
//  UIBarButtonItem+LJC.m
//  LJC
//
//  Created by Ralph Li on 12-5-31.
//  Copyright (c) 2012年 Heisoo. All rights reserved.
//

#import "UIBarButtonItem+LJC.h"
#import "UIButton+LJC.h"

@implementation UIBarButtonItem (LJC)

+ (UIBarButtonItem*) barButtonItemWithTarget:(id)target action:(SEL)action imgN:(NSString*)imgN imgH:(NSString*)imgH title:(NSString *)title
{
    return [UIBarButtonItem barButtonItemWithTarget:target action:action imgN:imgN imgH:imgH imgD:nil title:title];
}


+ (UIBarButtonItem*) barButtonItemWithTarget:(id)target
                                      action:(SEL)action
                                        imgN:(NSString*)imgN
                                        imgH:(NSString*)imgH
                                        imgD:(NSString*)imgD
                                       title:(NSString*)title
{
    UIImage *iN = imgN?[UIImage imageNamed:imgN]:nil;
    
    UIButton *button = [UIButton buttonWithTarget:target action:action];
    button.bounds = CGRectMake(0, 0, iN.size.width, iN.size.height);
    button.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    
    [button setTitle:title forState:UIControlStateNormal];
    
    [button setImageN:imgN H:imgH D:imgD S:nil];
    
    UIBarButtonItem* bi;
    
    bi = [[UIBarButtonItem alloc] initWithCustomView:button];
//    bi.customView.backgroundColor = [UIColor orangeColor];
    
    return bi;
}

@end
