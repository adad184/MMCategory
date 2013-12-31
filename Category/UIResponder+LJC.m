//
//  UIResponder+LJC.m
//  traffic
//
//  Created by Ralph Li on 12/11/13.
//  Copyright (c) 2013 gaogenet. All rights reserved.
//

#import "UIResponder+LJC.h"

@implementation UIResponder (LJC)

static __weak id currentFirstResponder;

+(id)currentFirstResponder {
    currentFirstResponder = nil;
    [[UIApplication sharedApplication] sendAction:@selector(findFirstResponder:) to:nil from:nil forEvent:nil];
    return currentFirstResponder;
}

-(void)findFirstResponder:(id)sender {
    currentFirstResponder = self;
}


@end
