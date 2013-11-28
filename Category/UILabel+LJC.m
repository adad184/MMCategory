//
//  UILabel+LJC.m
//  LJC
//
//  Created by Ralph Li on 12-6-1.
//  Copyright (c) 2012年 Heisoo. All rights reserved.
//

#import "UILabel+LJC.h"

@implementation UILabel (LJC)

- (void)pure
{
    self.backgroundColor = [UIColor clearColor];
    self.lineBreakMode = NSLineBreakByTruncatingTail;
    self.clipsToBounds = YES;
}

- (float)getTrueHeight
{
    CGSize trueSize = [self.text sizeWithFont:self.font
                                     constrainedToSize:CGSizeMake(self.frame.size.width, CGFLOAT_MAX)
                                         lineBreakMode:self.lineBreakMode];
    return trueSize.height;
}

@end
