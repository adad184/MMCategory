//
//  UIFont+LJC.m
//  LJC
//
//  Created by Ralph Li on 3/25/13.
//  Copyright (c) 2013 LJC. All rights reserved.
//

#import "UIFont+LJC.h"

@implementation UIFont (LJC)

- (CGSize)getSizeOfStringLine:(NSString *)str
{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    CGSize size = [str sizeWithFont:self
                  constrainedToSize:CGSizeMake(CGFLOAT_MAX, 50)
                      lineBreakMode:NSLineBreakByWordWrapping];
#pragma clang diagnostic pop
    
    return size;
}
@end
