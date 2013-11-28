//
//  UIToolbar+LJC.h
//  LJC
//
//  Created by  on 12-6-8.
//  Copyright (c) 2012年 Heisoo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIToolbar (LJC)

- (void)buildToolbar:(NSArray *)buttons 
              images:(NSArray *)images 
                hasH:(BOOL)hasH 
                hasS:(BOOL)hasS 
                hasD:(BOOL)hasD 
              titles:(NSArray*)titles;

@end
