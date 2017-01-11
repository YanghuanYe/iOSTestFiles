//
//  MainPageViewController.m
//  urlsession
//
//  Created by apple on 2016/12/1.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "MainPageViewController.h"
#import "ViewController12.h"
#import "PlanViewController.h"
#import "cccTableViewController.h"

@interface MainPageViewController ()

@end

@implementation MainPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIBarButtonItem *rItem = [[UIBarButtonItem alloc] initWithTitle:@"点击" style:UIBarButtonItemStyleDone target:self action:@selector(addSearchView)];
    self.navigationItem.rightBarButtonItem = rItem;
    
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.view addSubview:btn];
    btn.frame = CGRectMake(50, 50, 200, 200);
    [btn setTitle:@"nnnnnn" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(jumpToVC) forControlEvents:UIControlEventTouchUpInside];
}
- (void)addSearchView {
    
}

- (void)jumpToVC {
    ViewController12 *vc = [[PlanViewController alloc] init];
//    cccTableViewController *vc = [[cccTableViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
