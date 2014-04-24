//
//  NSString+LJC.h
//  
//
//  Created by  on 12-2-23.
//  Copyright (c) 2012年 LJC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (LJC)

- (NSString *) trimHead;
- (NSString *) trimTail;
- (NSString *) trimBoth;
- (NSString *) MD5;
- (NSString *) AES;
- (NSString *) UTF8;

- (BOOL) equals:(NSString*)str;
- (CGFloat) heightByFont:(UIFont*)font width:(CGFloat)width;
- (CGFloat) widthByFont:(UIFont*)font;


-(NSString *) URLEncodingUTF8String;//编码
-(NSString *) URLDecodingUTF8String;//解码

@end
