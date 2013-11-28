//
//  NSAttributedString+LJC.m
//  LJC
//
//  Created by Ralph Li on 6/28/13.
//  Copyright (c) 2013 LJC. All rights reserved.
//

#import "NSAttributedString+LJC.h"
#import <CoreText/CoreText.h>

@implementation NSAttributedString (LJC)

- (CGFloat)heightByWidth:(CGFloat)width
{
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((__bridge CFAttributedStringRef)self);
    CGSize targetSize = CGSizeMake(width, CGFLOAT_MAX);
    CGSize fitSize = CTFramesetterSuggestFrameSizeWithConstraints(framesetter, CFRangeMake(0, [self length]), NULL, targetSize, NULL);
    CFRelease(framesetter);
    
    return fitSize.height;
}

@end
