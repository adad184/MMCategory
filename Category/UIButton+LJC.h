//
//  UIButton+LJC.h
//  LJC
//
//  Created by Ralph Li on 12-5-31.
//  Copyright (c) 2012年 Heisoo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (LJC)

+ (UIButton*) buttonWithTarget:(id)target action:(SEL)sel;
- (void) setTextN:(NSString*)n H:(NSString*)h D:(NSString*)d S:(NSString *)s;
- (void) setImageN:(NSString*)n H:(NSString*)h D:(NSString*)d S:(NSString *)s;
- (void) setBackgroundImageN:(NSString*)n H:(NSString*)h D:(NSString*)d S:(NSString *)s;

@end
