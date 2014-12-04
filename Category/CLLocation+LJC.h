//
//  CLLocation+LJC.h
//  driving
//
//  Created by Ralph Li on 8/8/14.
//  Copyright (c) 2014 LJC. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>

@interface CLLocation (LJC)

//+ (CLLocation*) WGStoCGJ:(CLLocation*)gcj;
//
//- (CLLocation*) toGCJ;

//从地图坐标转化到火星坐标
- (CLLocation*) locationMarsFromEarth;

//从火星坐标转化到百度坐标
- (CLLocation*) locationBaiduFromMars;

//从百度坐标到火星坐标
- (CLLocation*) locationMarsFromBaidu;

@end
