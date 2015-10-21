//
//  MapOverlay.m
//  MapOverlayTest
//
//  Created by 千chin on 2015/10/13.
//  Copyright (c) 2015年 千chin. All rights reserved.
//

#import "MapOverlayView.h"
#import "MapOverlay.h"
#import "Taiwan.h"

@implementation MapOverlay

@synthesize coordinate;
@synthesize boundingMapRect;

- (instancetype)initWithTaiwan:(Taiwan *)taiwan {
    self = [super init];
    if (self) {
        boundingMapRect = taiwan.overlayBoundingMapRect;
        coordinate = taiwan.midCoordinate;
    }
    return self;
}

@end

