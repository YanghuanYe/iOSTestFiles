//
//  cccTableViewController.m
//  urlsession
//
//  Created by apple on 2016/11/29.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "cccTableViewController.h"
#import "NSArray+Log.h"
#import "TableViewCell1.h"
#import "ViewController11.h"
#import "TableViewCell2.h"

@interface cccTableViewController ()

@end

@implementation cccTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIEdgeInsets inset = UIEdgeInsetsZero;
    for (UIView *subview in self.tableView.subviews) {
        if ([NSStringFromClass([subview class]) isEqualToString:@"UITableViewWrapperView"]) {
            subview.frame = CGRectMake(0, 0, self.tableView.bounds.size.width, self.tableView.bounds.size.height);
            UIEdgeInsets inset = UIEdgeInsetsZero;
        }
    }
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 300;
    self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(resign)]];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    __weak typeof(self) weakSelf = self;
    self.newBlock = ^(){
        __strong typeof(weakSelf) strongSelf = weakSelf;
        
        TableViewCell1 *cell = [strongSelf.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
        NSString *name = cell.nameTextField.text;
        NSString *phone = cell.phoneTextField.text;
        NSString *address = cell.addressTextField.text;
        NSString *detailedAddress = cell.detailedAddressTextField.text;
        if ([self strIsEmpty:name promptName:@"姓名"] || [self strIsEmpty:phone promptName:@"号码"] || [self strIsEmpty:address promptName:@"地址"] || [self strIsEmpty:detailedAddress promptName:@"详细地址"]) {
            return ;
        }
        TableViewCell2 *cell2 = [strongSelf.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:1]];
        NSArray *array = @[name, phone, address, detailedAddress, cell2.remarksArr];
        
        ViewController11 *vc = [[ViewController11 alloc] init];
        vc.dataArr = array;
//        [strongSelf.navigationController pushViewController:vc animated:YES];
    };
}
- (BOOL)strIsEmpty:(NSString *)str promptName:(NSString *)name {
    if (str.length == 0) {
        NSString *prompt = [NSString stringWithFormat:@"%@栏还没有填写完成!", name];
        UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"prompt" message:prompt preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"hao" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alertC addAction:defaultAction];
        [self presentViewController:alertC animated:YES completion:^{
            
        }];
        return YES;
    }
    return NO;
}

- (void)resign {
    [self.view endEditing:YES];
    NSLog(@"resign");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        static NSString *reuseID = @"cell";
        TableViewCell1 *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
        if (cell == nil) {
            cell = [[TableViewCell1 alloc] init];
        }
        return cell;
    } else {
        TableViewCell2 *cell = [[TableViewCell2 alloc] init];
        return cell;
    }
}

@end
