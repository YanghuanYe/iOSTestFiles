//
//  FoldTableViewController.m
//  urlsession
//
//  Created by apple on 2016/12/5.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "FoldTableViewController.h"
#import "FoldTableViewCell.h"
#import "FoldModel.h"
#import <MJRefresh.h>

@interface FoldTableViewController ()<FoldTableViewCellFoldProtocol>

@property (nonatomic, strong)NSMutableArray *foldArr;
@property (nonatomic, assign)NSInteger rowsIndex;

@end

@implementation FoldTableViewController

static NSString *reuseID = @"reuse";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _rowsIndex = 0;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 200;
    
    [self.tableView registerClass:[FoldTableViewCell class] forCellReuseIdentifier:reuseID];
    
    _foldArr = [NSMutableArray array];
    __weak typeof(self) weakSelf = self;
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        __strong typeof(weakSelf) strongSelf = weakSelf;
//        [strongSelf.tableView.mj_header beginRefreshing];
        _rowsIndex = 1;
        [strongSelf refreshFoldArr];
        [strongSelf.tableView reloadData];
        [strongSelf.tableView.mj_header endRefreshing];
    }];
    self.tableView.mj_footer = [MJRefreshBackStateFooter footerWithRefreshingBlock:^{
        __strong typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf.tableView.mj_footer beginRefreshing];
        [strongSelf addMoreFoldArr];
        [strongSelf.tableView reloadData];
        [strongSelf.tableView.mj_footer endRefreshing];
    }];
    [self.tableView.mj_header beginRefreshing];
}
- (void)refreshFoldArr {
    [_foldArr removeAllObjects];
    for (int i = 0; i < _rowsIndex * 10; i++) {
        FoldModel *fm = [FoldModel newWithBtnName:[NSString stringWithFormat:@"button%@", @(i)] LaName:[NSString stringWithFormat:@"label%i", i] type:(i % 2 == 0 ? FoldTableViewCellTypeFold : FoldTableViewCellTypeUnfold)];
        [_foldArr addObject:fm];
    }
}
- (void)addMoreFoldArr {
    _rowsIndex++;
    for (int i = (_rowsIndex-1)*10; i < _rowsIndex*10; i++) {
        FoldModel *fm = [FoldModel newWithBtnName:[NSString stringWithFormat:@"button%@", @(i)] LaName:[NSString stringWithFormat:@"label%i", i] type:FoldTableViewCellTypeUnfold];
        //(i % 2 == 0 ? FoldTableViewCellTypeFold : FoldTableViewCellTypeUnfold)
        [_foldArr addObject:fm];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _rowsIndex * 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FoldTableViewCell *cell = (FoldTableViewCell *)[tableView dequeueReusableCellWithIdentifier:reuseID];
    FoldModel *model = [_foldArr objectAtIndex:indexPath.row];
    cell.buttonName = model.buttonName;
    cell.labelName = model.labelName;
    cell.delegate = self;
    cell.indexPath = indexPath;
    cell.type = model.type;
    
    return cell;
}
- (void)foldCellWillBeUnfolded:(NSIndexPath *)indexPath {
    FoldModel *model = [_foldArr objectAtIndex:indexPath.row];
    model.type = ((model.type == FoldTableViewCellTypeUnfold) ? FoldTableViewCellTypeFold : FoldTableViewCellTypeUnfold);
//    if (model.type == FoldTableViewCellTypeUnfold) {
//        model.type = FoldTableViewCellTypeFold;
//    } else {
//        model.type = FoldTableViewCellTypeUnfold;
//    }
//    [_foldArr replaceObjectAtIndex:indexPath.row withObject:model];
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
