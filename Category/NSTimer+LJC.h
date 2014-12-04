//
//  NSTimer+LJC.h
//  driving
//
//  Created by Ralph Li on 9/28/14.
//  Copyright (c) 2014 LJC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer(LJC)

+(id)scheduledTimerWithTimeInterval:(NSTimeInterval)inTimeInterval block:(void (^)())inBlock repeats:(BOOL)inRepeats;
+(id)timerWithTimeInterval:(NSTimeInterval)inTimeInterval block:(void (^)())inBlock repeats:(BOOL)inRepeats;

-(void)pauseTimer;
-(void)resumeTimer;

@end
