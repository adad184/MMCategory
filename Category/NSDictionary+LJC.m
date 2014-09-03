//
//  NSDictionary+LJC.m
//  
//
//  Created by  on 12-2-17.
//  Copyright (c) 2012年 LJC. All rights reserved.
//

#import "NSDictionary+LJC.h"
#import "NSString+LJC.h"

@implementation NSDictionary (LJC)

- (BOOL)success
{
    NSString *str = [self objectForKey:@"success"];
    
    if ( str && ([str equals:@"true"]))
    {
        return YES;
    }
    
    return NO;
}

- (NSString *)msg
{
    return [self objectForKey:@"message"];
}

// in case of [NSNull null] values a nil is returned ...
- (id)objectForKeyNotNull:(id)key {
    id object = [self objectForKey:key];
    if (object == [NSNull null])
        return @"";
    
    return object;
}

- (id)objectForKeyNotNil:(id)key {
    id object = [self objectForKeyNotNull:key];
    if (object == nil)
        return @"";
    
    return object;
}

@end
