//
//  LocationTestViewController.h
//  loc1
//
//  Created by kodama on 2013/05/01.
//  Copyright (c) 2013年 kodama & Company, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface LocationTestViewController : UIViewController<CLLocationManagerDelegate> {
	CLLocationManager *locationManager;
	MKMapView *regionsMapView;
}

@property (nonatomic, retain) CLLocationManager *locationManager;

@end
