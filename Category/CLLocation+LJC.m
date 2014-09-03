//
//  CLLocation+LJC.m
//  driving
//
//  Created by Ralph Li on 8/8/14.
//  Copyright (c) 2014 LJC. All rights reserved.
//

#import "CLLocation+LJC.h"

@implementation CLLocation (LJC)

//World Geodetic System ==> Mars Geodetic System
//translate from csharp: https://on4wp7.codeplex.com/SourceControl/changeset/view/21483#353936
const double a = 6378245.0;
const double ee = 0.00669342162296594323;

+ (CLLocation *)WGStoCGJ:(CLLocation *)gcj
{
    CLLocationCoordinate2D coor = [CLLocation wgs84ToGcj02:gcj.coordinate];
    
    return [[CLLocation alloc] initWithLatitude:coor.latitude longitude:coor.longitude];
}

- (CLLocation *)toGCJ
{
    return [CLLocation WGStoCGJ:self];
}

+(CLLocationCoordinate2D)wgs84ToGcj02:(CLLocationCoordinate2D)wgCoord{
    if ([self outOfChina:wgCoord.latitude lng:wgCoord.longitude]) {
        return wgCoord;
    }
    
    double wgLon = wgCoord.longitude;
    double wgLat =  wgCoord.latitude;
    double dLat = [self transformLat: wgLon - 105.0  y: wgLat - 35.0];
    double dLon = [self transformLon: wgLon - 105.0  y: wgLat - 35.0];
    double radLat = wgLat / 180.0 * M_PI;
    double magic = sin(radLat);
    magic = 1 - ee * magic * magic;
    double sqrtMagic = sqrt(magic);
    dLat = (dLat * 180.0) / ((a * (1 - ee)) / (magic * sqrtMagic) * M_PI);
    dLon = (dLon * 180.0) / (a / sqrtMagic * cos(radLat) * M_PI);
    double mgLat = wgLat + dLat;
    double mgLon = wgLon + dLon;
    return CLLocationCoordinate2DMake(mgLat, mgLon);
}

+(BOOL)outOfChina:(double)lat  lng:(double)lng {
    
    if (lng < 72.004 || lng > 137.8347){
        return YES;
    }
    
    if (lat < 0.8293 || lat > 55.8271){
        return YES;
    }
    
    return NO;
};

+(double)transformLat:(double)x y:(double)y{
    
    double ret = -100.0 + 2.0 * x + 3.0 * y + 0.2 * y * y + 0.1 * x * y + 0.2 * sqrt(fabs(x));
    ret += (20.0 * sin(6.0 * x * M_PI) + 20.0 * sin(2.0 * x * M_PI)) * 2.0 / 3.0;
    ret += (20.0 * sin(y * M_PI) + 40.0 * sin(y / 3.0 * M_PI)) * 2.0 / 3.0;
    ret += (160.0 * sin(y / 12.0 * M_PI) + 320 * sin(y * M_PI / 30.0)) * 2.0 / 3.0;
    return ret;
}

+(double)transformLon:(double)x  y:(double)y{
    double ret = 300.0 + x + 2.0 * y + 0.1 * x * x + 0.1 * x * y + 0.1 * sqrt(fabs(x));
    ret += (20.0 * sin(6.0 * x * M_PI) + 20.0 * sin(2.0 * x * M_PI)) * 2.0 / 3.0;
    ret += (20.0 * sin(x * M_PI) + 40.0 * sin(x / 3.0 * M_PI)) * 2.0 / 3.0;
    ret += (150.0 * sin(x / 12.0 * M_PI) + 300.0 * sin(x / 30.0 * M_PI)) * 2.0 / 3.0;
    return ret;
}
@end
