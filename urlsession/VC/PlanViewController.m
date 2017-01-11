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

@property (nonatomic, strong)NSMutableArray *arr1;
@property (nonatomic, strong)NSMutableArray *arr2;
@property (nonatomic, strong)NSMutableArray *arr3;
@property (nonatomic, strong)NSArray *dataArr;

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
    
    self.title = @"table";
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    UITableView *tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 44, kDEVICEWIDTH, KSELFVIEWHEIGHT-44) style:UITableViewStyleGrouped];
    [self.view addSubview:tableview];
    tableview.delegate = self;
    tableview.dataSource = self;
    
    self.arr1 = [NSMutableArray arrayWithArray:@[@1,@23,@4]];
    self.arr2 = [NSMutableArray arrayWithArray:@[@1,@23,@4,@1,@23,@6]];
    self.arr3 = [NSMutableArray arrayWithArray:@[@513,@12,@121]];
    self.dataArr = @[self.arr1,self.arr2,self.arr3];
    tableview.allowsMultipleSelectionDuringEditing = YES;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArr.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return ((NSArray *)self.dataArr[section]).count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"reuse"];
    
    NSArray *rowArr = self.dataArr[indexPath.section];
    cell.textLabel.text = [((NSNumber *)rowArr[indexPath.row]) stringValue];
    return cell;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [NSString stringWithFormat:@"#%li", section+1];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return UITableViewCellEditingStyleInsert | UITableViewCellEditingStyleDelete;
    return UITableViewCellEditingStyleDelete;
//    return UITableViewCellEditingStyleInsert;
}
//- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
//    return YES;
//}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSMutableArray *rowArr = (NSMutableArray *)self.dataArr[indexPath.section];
        [rowArr removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [tableView reloadData];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        NSMutableArray *rowArr = (NSMutableArray *)self.dataArr[indexPath.section];
        [rowArr insertObject:@"new" atIndex:indexPath.row];
        [tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        [tableView reloadData];
    } else {
        return;
    }
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
