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
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    CGSize trueSize = [self.text sizeWithFont:self.font
                            constrainedToSize:CGSizeMake(self.frame.size.width, CGFLOAT_MAX)
                                lineBreakMode:self.lineBreakMode];
#pragma clang diagnostic pop
    return trueSize.height;
}

+ (id)pureLabel
{
    return [UILabel pureLabelWithFrame:CGRectZero];
}

+ (id)pureLabelWithFrame:(CGRect)frame
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    [label pure];
    
    return label;
}



@end
