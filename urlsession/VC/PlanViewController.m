//
//  PlanViewController.m
//  urlsession
//
//  Created by apple on 2016/12/26.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "PlanViewController.h"
#import <Photos/Photos.h>
//#import "Macro.h"
#import "YHMacro.h"

@interface PlanViewController ()<UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)UIImage *backImage;
@property (nonatomic, strong)UIImageView *backImageView;
@property (nonatomic, strong)UIScrollView *planScrollView;

@end

@implementation PlanViewController

#pragma mark - Lifecycle
//- (void)dealloc {}
//- (instancetype)init {}
//- (void)viewDidLoad {}
//- (void)viewWillAppear:(BOOL)animated {}
//- (void)didReceiveMemoryWarning {}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    PHAuthorizationStatus authorStatus = [PHPhotoLibrary authorizationStatus];
    NSLog(@"openGallery_authorStatus == %ld",(long)authorStatus);
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.planScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kDEVICEWIDTH, kDEVICEHEIGHT)];
    self.planScrollView.userInteractionEnabled = YES;
    self.planScrollView.maximumZoomScale = 20.0;
    self.planScrollView.minimumZoomScale = 0.001;
    self.planScrollView.backgroundColor = [UIColor blueColor];
    self.planScrollView.delegate = self;
    [self.view addSubview:self.planScrollView];
    
    self.backImage = [UIImage imageNamed:@"屏幕快照 2016-12-24 下午9.47.03"];
    self.backImageView = [[UIImageView alloc] initWithImage:self.backImage];
    self.backImageView.userInteractionEnabled = YES;
    self.backImageView.frame = self.planScrollView.frame;
    
    [self.planScrollView addSubview:self.backImageView];
    
    UITableView *tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kDEVICEWIDTH, KSELFVIEWHEIGHT) style:UITableViewStyleGrouped];
    [self.view addSubview:tableview];
    tableview.delegate = self;
    tableview.dataSource = self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 3;
    } else if (section == 1) {
        return 5;
    } else {
        return 8;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"reuse"];
    cell.textLabel.text = [NSString stringWithFormat:@"Section%li --- Row%li", (long)indexPath.section, (long)indexPath.row];
    return cell;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [NSString stringWithFormat:@"#%li", section+1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 系统回调方法 UITableViewDataSource

#pragma mark - CustomDelegate

#pragma mark - Public
//外界调用的公共方法

#pragma mark - Private
//自定义，内部手动调用的方法

#pragma mark - Event Response
//1.IBAction.
//2.UITapGestureRecognizer.
//3.NSNotification.
//4.NSTimer.

#pragma mark - Getter

#pragma mark - Setter

#pragma mark - NSCopying

#pragma mark - NSObject
//- (NSString *)description {}

#pragma mark - delegate
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.backImageView;
}


@end
