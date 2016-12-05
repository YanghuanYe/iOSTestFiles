//
//  MainPageViewController.m
//  urlsession
//
//  Created by apple on 2016/12/1.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "MainPageViewController.h"

@interface MainPageViewController ()

@end

@implementation MainPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.view addSubview:btn];
    btn.frame = CGRectMake(50, 50, 200, 200);
    [btn setTitle:@"nnnnnn" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(jumpToVC) forControlEvents:UIControlEventTouchUpInside];
}
- (void)jumpToVC {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
