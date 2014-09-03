//
//  CLLocation+LJC.h
//  driving
//
//  Created by Ralph Li on 8/8/14.
//  Copyright (c) 2014 LJC. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>

@interface CLLocation (LJC)

+ (CLLocation*) WGStoCGJ:(CLLocation*)gcj;

- (CLLocation*) toGCJ;

@end
