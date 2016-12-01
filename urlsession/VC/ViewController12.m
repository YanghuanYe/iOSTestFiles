//
//  ViewController12.m
//  urlsession
//
//  Created by apple on 2016/11/28.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "ViewController12.h"
#import "NSArray+Log.h"
#import "TableViewCell1.h"
#import "cccTableViewController.h"

#define lalaLog(block) \
if(block) {\
block();\
}

@interface ViewController12 ()< UITextFieldDelegate>

@property (nonatomic, strong)cccTableViewController *vc;

@end

@implementation ViewController12

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.hidden = YES;
    self.view.backgroundColor = [UIColor blueColor];
    _vc = [[cccTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
    [self addChildViewController:_vc];
    _vc.view.frame = CGRectMake(0, 44, self.view.bounds.size.width, self.view.bounds.size.height -44 - 44);
    [self.view addSubview:_vc.view];
    
    lalaLog(^(){
        NSLog(@"lalalaala");
    });
    
    UIButton *nextBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.view addSubview:nextBtn];
    nextBtn.frame = CGRectMake(0, self.view.bounds.size.height -44, self.view.bounds.size.width, 44);
    [nextBtn setTitle:@"下一步" forState:UIControlStateNormal];
    [nextBtn addTarget:self action:@selector(nextBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)nextBtnClick {
    if (_vc.newBlock) {
        _vc.newBlock();
    }
}

@end
