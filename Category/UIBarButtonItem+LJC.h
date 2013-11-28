//
//  UIBarButtonItem+LJC.h
//  LJC
//
//  Created by Ralph Li on 12-5-31.
//  Copyright (c) 2012年 Heisoo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (LJC)

+ (UIBarButtonItem*) barButtonItemWithTarget:(id)target
                                      action:(SEL)action
                                        imgN:(NSString*)imgN
                                        imgH:(NSString*)imgH
                                       title:(NSString*)title;


+ (UIBarButtonItem*) barButtonItemWithTarget:(id)target
                                      action:(SEL)action
                                        imgN:(NSString*)imgN
                                        imgH:(NSString*)imgH
                                        imgD:(NSString*)imgD
                                       title:(NSString*)title;

@end
