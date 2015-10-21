//
//  MapOverlay.h
//  MapOverlayTest
//
//  Created by 千chin on 2015/10/13.
//  Copyright (c) 2015年 千chin. All rights reserved.
//

#import <MapKit/MapKit.h>

@class Taiwan;

@interface MapOverlay : NSObject <MKOverlay>


- (instancetype)initWithTaiwan:(Taiwan *)taiwan;

@end
