//
//  UILabel+LJC.h
//  LJC
//
//  Created by Ralph Li on 12-6-1.
//  Copyright (c) 2012年 Heisoo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (LJC)

- (void) pure;
- (float) getTrueHeight;

+ (id) pureLabel;
+ (id) pureLabelWithFrame:(CGRect)frame;

@end
