//
//  NSDictionary+LJC.h
//  
//
//  Created by  on 12-2-17.
//  Copyright (c) 2012年 LJC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (LJC)

@property (nonatomic, readonly) BOOL success;
@property (nonatomic, readonly) NSString *msg;

- (id)objectForKeyNotNull:(id)key;

@end
