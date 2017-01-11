//
//  LocationViewController.m
//  urlsession
//
//  Created by apple on 2017/1/11.
//  Copyright © 2017年 YYH. All rights reserved.
//

#import "LocationViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface LocationViewController ()<CLLocationManagerDelegate>

@property (nonatomic, strong)CLLocationManager *locationManager;

@end

@implementation LocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc] initWithTitle:@"定位" style:UIBarButtonItemStylePlain target:self action:@selector(findMe)];
    self.navigationItem.rightBarButtonItem = rightBarButton;
}
- (void)findMe {
    if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
//        NSLog(@"requestAlwaysAuthorization.");
//        [self.locationManager requestAlwaysAuthorization];
        
        NSLog(@"requestWhenInUseAuthorization");
        [self.locationManager requestWhenInUseAuthorization];
    }
    
    [self.locationManager startUpdatingLocation];
    NSLog(@"start gps");
}

#pragma mark - CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    // 1.  get user location object
    CLLocation *location = [locations lastObject];
    CLLocationCoordinate2D coordinate = location.coordinate;
    NSLog(@"%f, %f", coordinate.latitude, coordinate.longitude);
    
    [manager stopUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    if (error.code == kCLErrorDenied) {
        NSLog(@"No authorization by user");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CLLocationManager *)locationManager {
    if (!_locationManager) {
        _locationManager = [CLLocationManager new];
        _locationManager.delegate = self;
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    }
    return _locationManager;
}

@end
