//
//  MapOverlayView.h
//  MapOverlayTest
//
//  Created by 千chin on 2015/10/15.
//  Copyright © 2015年 千chin. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface MapOverlayView : MKOverlayRenderer

- (instancetype)initWithOverlay:(id<MKOverlay>)overlay overlayImage:(UIImage *)overlayImage;

@end
