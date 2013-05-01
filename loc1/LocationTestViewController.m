//
//  LocationTestViewController.m
//  loc1
//
//  Created by kodama on 2013/05/01.
//  Copyright (c) 2013年 kodama & Company, Inc. All rights reserved.
//

#import "LocationTestViewController.h"

@interface LocationTestViewController ()

@end

@implementation LocationTestViewController

@synthesize locationManager;

- (void)viewDidLoad
{
    [super viewDidLoad];

	// MapViewを作成
	regionsMapView = [[MKMapView alloc] init];
	// 画面サイズ取得
	UIScreen* screen = [UIScreen mainScreen];
	// マップを画面一杯に広げて配置する
	regionsMapView.frame = CGRectMake(0, 0,screen.applicationFrame.size.width, screen.applicationFrame.size.height);
	[self.view addSubview:regionsMapView];

	// 現在位置座標の取得
	locationManager = [[CLLocationManager alloc] init];
	locationManager.delegate = self;
	locationManager.distanceFilter = kCLLocationAccuracyHundredMeters;
	locationManager.desiredAccuracy = kCLLocationAccuracyBest;
	[locationManager startUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    CLLocationCoordinate2D coordinate = newLocation.coordinate;
	[regionsMapView setCenterCoordinate:coordinate animated:NO];
	
    // 縮尺を設定
    MKCoordinateRegion zoom = regionsMapView.region;
	zoom.center = coordinate; // 取得座標を画面中心に移動
    zoom.span.latitudeDelta = 0.005;
    zoom.span.longitudeDelta = 0.005;
    [regionsMapView setRegion:zoom animated:YES];
    regionsMapView.showsUserLocation=TRUE;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
