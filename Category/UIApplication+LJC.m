//
//  UIApplication+LJC.m
//  museum
//
//  Created by Ralph Li on 2/8/14.
//  Copyright (c) 2014 LJC. All rights reserved.
//

#import "UIApplication+LJC.h"

@implementation UIApplication (LJC)


+(CGSize) currentSize
{
    CGSize size = [UIScreen mainScreen].bounds.size;
    
    if (UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation))
    {
        size = CGSizeMake(size.height, size.width);
    }
    return size;
}

@end
