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

- (void) autoResize:(UIViewAutoresizing)mask
{
	self.autoresizingMask = mask;
	self.autoresizesSubviews = YES;
}

- (void)addToolbar:(UIView *)toolbar
{
    toolbar.frame = CGRectMake(0
                               , self.frame.size.height-toolbar.frame.size.height
                               , toolbar.frame.size.width
                               , toolbar.frame.size.height);
    [toolbar autoResize:FixedMarginB];
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

@end
