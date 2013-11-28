//
//  MKMapView+LJC.h
//  
//
//  Created by  on 12-1-13.
//  Copyright (c) 2012年 LJC. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface MKMapView (LJC)

- (void)setCenterCoordinate:(CLLocationCoordinate2D)centerCoordinate
                  zoomLevel:(NSUInteger)zoomLevel
                   animated:(BOOL)animated;

-(MKCoordinateRegion)coordinateRegionWithMapView:(MKMapView *)mapView
                                centerCoordinate:(CLLocationCoordinate2D)centerCoordinate
                                    andZoomLevel:(NSUInteger)zoomLevel;

- (NSUInteger) zoomLevel;

@end
