//
//  Taiwan.m
//  MapOverlayTest
//
//  Created by 千chin on 2015/10/13.
//  Copyright (c) 2015年 千chin. All rights reserved.
//

#import "Taiwan.h"

@implementation Taiwan

- (instancetype)initWithFilename:(NSString *)filename {
    self = [super init];
    if (self) {
        NSString *filePath = [[NSBundle mainBundle] pathForResource:filename ofType:@"plist"];
        NSDictionary *properties = [NSDictionary dictionaryWithContentsOfFile:filePath];
        
        CGPoint midPoint = CGPointFromString(properties[@"midCoord"]);
        _midCoordinate = CLLocationCoordinate2DMake(midPoint.x, midPoint.y);
        
        CGPoint overlayTopLeftPoint = CGPointFromString(properties[@"overlayTopLeftCoord"]);
        _overlayTopLeftCoordinate = CLLocationCoordinate2DMake(overlayTopLeftPoint.x, overlayTopLeftPoint.y);
        
        CGPoint overlayTopRightPoint = CGPointFromString(properties[@"overlayTopRightCoord"]);
        _overlayTopRightCoordinate = CLLocationCoordinate2DMake(overlayTopRightPoint.x, overlayTopRightPoint.y);
        
        CGPoint overlayBottomLeftPoint = CGPointFromString(properties[@"overlayBottomLeftCoord"]);
        _overlayBottomLeftCoordinate = CLLocationCoordinate2DMake(overlayBottomLeftPoint.x, overlayBottomLeftPoint.y);
        
        
        CGPoint colorBottomLeftPoint = CGPointFromString(properties[@"colorBottomLeft"]);
        _colorBottomLeft = CLLocationCoordinate2DMake(colorBottomLeftPoint.x, colorBottomLeftPoint.y);
        
        CGPoint colorTopRightPoint = CGPointFromString(properties[@"colorTopRight"]);
        _colorTopRight = CLLocationCoordinate2DMake(colorTopRightPoint.x, colorTopRightPoint.y);
        
        CGPoint colorTopLeftPoint = CGPointFromString(properties[@"colorTopLeft"]);
        _colorTopLeft = CLLocationCoordinate2DMake(colorTopLeftPoint.x, colorTopLeftPoint.y);
        
    }
    
    return self;
}

- (CLLocationCoordinate2D)colorBottomRight {
    return CLLocationCoordinate2DMake(self.colorBottomLeft.latitude, self.colorTopRight.longitude);
}

- (CLLocationCoordinate2D)overlayBottomRightCoordinate {
    return CLLocationCoordinate2DMake(self.overlayBottomLeftCoordinate.latitude, self.overlayTopRightCoordinate.longitude);
}

- (MKMapRect)overlayBoundingMapRect {
    
    MKMapPoint topLeft = MKMapPointForCoordinate(self.overlayTopLeftCoordinate);
    MKMapPoint topRight = MKMapPointForCoordinate(self.overlayTopRightCoordinate);
    MKMapPoint bottomLeft = MKMapPointForCoordinate(self.overlayBottomLeftCoordinate);
    
    return MKMapRectMake(topLeft.x,
                         topLeft.y,
                         fabs(topLeft.x - topRight.x),
                         fabs(topLeft.y - bottomLeft.y));
}


@end
