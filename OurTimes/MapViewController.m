//
//  MapViewController.m
//  MapOverlayTest
//
//  Created by 千chin on 2015/10/21.
//  Copyright © 2015年 千chin. All rights reserved.
//

#import "MapViewController.h"
#import "Taiwan.h"
#import "MapOverlay.h"
#import "MapOverlayView.h"

@interface MapViewController ()<CLLocationManagerDelegate,MKMapViewDelegate>
{
    CLLocationManager * location;
}
@property (weak, nonatomic) IBOutlet MKMapView *myMap;
@property Taiwan * taiwan;

@end

@implementation MapViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.myMap.delegate = self;
    self.taiwan = [[Taiwan alloc]initWithFilename:@"Property List"];
    
    CLLocationDegrees latDelta = self.taiwan.overlayTopLeftCoordinate.latitude - self.taiwan.overlayBottomRightCoordinate.latitude;
    
    MKCoordinateSpan span = MKCoordinateSpanMake(fabsf(latDelta), 0.0);
    
    MKCoordinateRegion region = MKCoordinateRegionMake(self.taiwan.midCoordinate, span);
    
    [location requestWhenInUseAuthorization];
    
    self.myMap.region = region;
    [self addOverlay];
    
}
-(void)viewDidAppear:(BOOL)animated
{
    MKCoordinateRegion region =MKCoordinateRegionMake(CLLocationCoordinate2DMake(23.7117, 120.8515), MKCoordinateSpanMake(2, 2));
    [self.myMap setRegion:region];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)addOverlay
{
    //底圖顏色
    CLLocationCoordinate2D points[4];
    points[0] = CLLocationCoordinate2DMake(10, 110);
    points[1] = CLLocationCoordinate2DMake(30, 110);
    points[2] = CLLocationCoordinate2DMake(30, 130);
    points[3] = CLLocationCoordinate2DMake(10, 130);
    
    MKPolygon *poly = [MKPolygon polygonWithCoordinates:points count:4];
    MapOverlay *overlay = [[MapOverlay alloc] initWithTaiwan:self.taiwan];
    [self.myMap addOverlay:poly];
    [self.myMap addOverlay:overlay];
}

-(MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay
{
    if([overlay isKindOfClass:MapOverlay.class]){
        UIImage *image = [UIImage imageNamed:@"Taiwan"];
        
        MapOverlayView *overlayView = [[MapOverlayView alloc] initWithOverlay:overlay overlayImage:image];
        
        return overlayView;
    }else if([overlay isKindOfClass:[MKPolygon class]]){
        MKPolygonRenderer *overView = [[MKPolygonRenderer alloc] initWithPolygon:(MKPolygon *)overlay];
        
        overView.fillColor = [UIColor colorWithRed:0.36 green:0.74 blue:0.74 alpha:1.0];
        return overView;
    }
    return nil;
}

-(void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated
{
    MKCoordinateRegion region = self.myMap.region;
    
    if(region.span.latitudeDelta > 3.55){
        
        //寫入region
        region.center = self.taiwan.midCoordinate; //region的中心
        region.span.latitudeDelta = 3.5;
        region.span.longitudeDelta = 3.5;
        [self.myMap  setRegion:region animated:true];
        
        NSLog(@"啊啊regionWillChangeAnimated");
    }
}

-(void)mapViewWillStartRenderingMap:(MKMapView *)mapView{
    MKCoordinateRegion region = self.myMap.region;
    
    MKMapPoint point1 = MKMapPointForCoordinate(region.center);
    MKMapPoint point2 = MKMapPointForCoordinate(self.taiwan.midCoordinate);
    CLLocationDistance distance = MKMetersBetweenMapPoints(point1, point2)/1000;
    
    if(distance > 250)
    {
        region.center = self.taiwan.midCoordinate; //region的中心
        [self.myMap  setRegion:region animated:true];
        
        NSLog(@"噢買尬");
    }
    
}
@end
