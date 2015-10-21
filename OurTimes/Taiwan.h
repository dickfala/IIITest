//
//  Taiwan.h
//  MapOverlayTest
//
//  Created by 千chin on 2015/10/13.
//  Copyright (c) 2015年 千chin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Taiwan : NSObject

@property (nonatomic, readonly) CLLocationCoordinate2D *boundary;
@property (nonatomic, readonly) NSInteger boundaryPointsCount;

@property (nonatomic, readonly) CLLocationCoordinate2D midCoordinate;
@property (nonatomic, readonly) CLLocationCoordinate2D overlayTopLeftCoordinate;
@property (nonatomic, readonly) CLLocationCoordinate2D overlayTopRightCoordinate;
@property (nonatomic, readonly) CLLocationCoordinate2D overlayBottomLeftCoordinate;
@property (nonatomic, readonly) CLLocationCoordinate2D overlayBottomRightCoordinate;
@property (nonatomic, readonly) CLLocationCoordinate2D colorBottomLeft;
@property (nonatomic, readonly) CLLocationCoordinate2D colorTopRight;
@property (nonatomic, readonly) CLLocationCoordinate2D colorTopLeft;
@property (nonatomic, readonly) CLLocationCoordinate2D colorBottomRight;




@property (nonatomic, readonly) MKMapRect overlayBoundingMapRect;

@property (nonatomic, strong) NSString *name;

- (instancetype)initWithFilename:(NSString *)filename;


@end
