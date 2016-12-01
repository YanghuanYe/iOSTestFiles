//
//  YBAlertView.m
//  YBAlert
//
//  Created by YeYanghuan on 16/8/17.
//  Copyright © 2016年 wu bing. All rights reserved.
//

#import "YBAlertView.h"
#import "Masonry.h"
#import "UIColor+ZSB.h"
//#import "CHUtil.h"

#define hudViewH 120

#define AlertViewTag 998

@interface YBAlertView()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, strong) UIView *alertView;
@property(nonatomic, strong) UIButton *yesButton;
@property(nonatomic, strong) UIButton *noButton;
@property(nonatomic, strong) UIView *verticalLine;
@property(nonatomic, strong) UIView *horizontalLine;
@property(nonatomic, strong) UILabel  *tipsLabel;
@property(nonatomic, strong) UITableView *contentList;
@property(nonatomic, strong) UILabel   *titleLabel;

@property (nonatomic, strong)UIView *hudView;
@property (nonatomic, strong)UILabel *hudLabel;
@property (nonatomic, strong)UIActivityIndicatorView *hudIndicator;
@property (nonatomic, strong)UILabel *errLabel;

@property(nonatomic, copy) NSString * title;
@property(nonatomic, strong) NSArray * lists;
@property(nonatomic, copy) NSString * tips;
@property (nonatomic, copy)NSString *hint;
@property (nonatomic, copy)NSString *errorStr;
@property (nonatomic, copy)AlertViewBlock block;

@end

@implementation YBAlertView

+ (instancetype)alertViewHUDWithHint:(NSString *)hint
{
    if ([[UIApplication sharedApplication].keyWindow.subviews.lastObject isKindOfClass:[YBAlertView class]]) {
        return nil;
    }
    YBAlertView *alertView = [[YBAlertView alloc] initWithFrame:CGRectZero hint:hint];
    [alertView appear];
    return alertView;
}
- (void)successShowWithTitle:(NSString *)title lists:(NSArray *)lists tips:(NSString *)tips block:(AlertViewBlock)block
{
    [self.hudView removeFromSuperview];
    [self AlertViewAppearWithTitle:title lists:lists tips:tips block:block];
}
- (void)AlertViewAppearWithTitle:(NSString *)title lists:(NSArray *)lists tips:(NSString*)tips block:(AlertViewBlock)block
{
    self.title = title;
    self.lists = lists;
    self.tips = tips;
    self.block = block;
    [self addSubview:self.alertView];
    [self.alertView addSubview:self.yesButton];//因为产品需求原因，yesBtn内容为"否"。。。。
    [self.alertView addSubview:self.noButton];//因为产品需求原因，noBtn内容为"是"。。。。
    [self.alertView addSubview:self.verticalLine];
    [self.alertView addSubview:self.horizontalLine];
    [self.alertView addSubview:self.tipsLabel];
    [self.alertView addSubview:self.contentList];
    [self.alertView addSubview:self.titleLabel];
    [self layoutSubPages];
}
- (void)failureWithErrorStr:(NSString *)errorStr
{
    errorStr = (errorStr.length == 0 ? @"请求失败..." : errorStr);
    self.errorStr = errorStr;
    [self.hudLabel removeFromSuperview];
    [self.hudView addSubview:self.errLabel];
    [self addErrConstraints];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self tapGestureClick];
    });
}
- (void)tapGestureClick
{
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [[[UIApplication sharedApplication].keyWindow viewWithTag:AlertViewTag] removeFromSuperview];
    }];
}

- (instancetype)initWithFrame:(CGRect)frame hint:(NSString *)hint
{
    if (self = [super initWithFrame:frame]) {
        if (CGRectIsEmpty(frame)) {
            self.frame = [UIScreen mainScreen].bounds;
        }
        hint = (hint.length == 0 ? @"正在加载..." : hint);
        self.hint = hint;
        [self addSubview:self.hudView];
        [self.hudView addSubview:self.hudLabel];
        [self.hudLabel addSubview:self.hudIndicator];
        [self addHUDConstraints];
    }
    return self;
}

+ (instancetype)alertViewWithTitle:(NSString *)title lists:(NSArray *)lists tips:(NSString *)tips block:(AlertViewBlock)block
{
    if ([[UIApplication sharedApplication].keyWindow.subviews.lastObject isKindOfClass:[YBAlertView class]]) {
        return nil;
    }
    YBAlertView *alertView = [[YBAlertView alloc] initWithFrame:CGRectZero title:title lists:lists tips:tips block:block];
    [alertView appear];
    return alertView;
}

- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title lists:(NSArray *)lists tips:(NSString *)tips {
    if ([[UIApplication sharedApplication].keyWindow.subviews.lastObject isKindOfClass:[YBAlertView class]]) {
        return nil;
    }
    if (self = [super initWithFrame:frame]) {
        if (CGRectIsEmpty(frame)) {
            self.frame = [UIScreen mainScreen].bounds;
        }
        self.backgroundColor = [[UIColor blueColor] colorWithAlphaComponent:0.5];
        self.tag = AlertViewTag;
        self.title = title;
        self.lists = lists;
        self.tips = tips;
        [self addSubview:self.alertView];
        [self.alertView addSubview:self.yesButton];
        [self.alertView addSubview:self.noButton];
        [self.alertView addSubview:self.verticalLine];
        [self.alertView addSubview:self.horizontalLine];
        [self.alertView addSubview:self.tipsLabel];
        [self.alertView addSubview:self.contentList];
        [self.alertView addSubview:self.titleLabel];
        self.alpha = 0;
        [self layoutSubPages];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title lists:(NSArray *)lists tips:(NSString *)tips block:(AlertViewBlock)block {
    if (self = [super initWithFrame:frame]) {
        if (CGRectIsEmpty(frame)) {
            self.frame = [UIScreen mainScreen].bounds;
        }
        [self AlertViewAppearWithTitle:title lists:lists tips:tips block:block];
    }
    return self;
}
- (void)appear
{
    self.backgroundColor = [[UIColor colorFromHex:@"#000000"] colorWithAlphaComponent:0.5];
    self.tag = AlertViewTag;
    self.alpha = 0;
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 1;
    }];
}

- (void)showWithTime:(CGFloat)showTime
{
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    [UIView animateWithDuration:showTime animations:^{
        self.alpha = 1;
    }];
}

#pragma mark- UITableViewDelegate UITableViewDataSourde
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.lists.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dic = (NSDictionary *)(self.lists[indexPath.row]);
    NSString *num = [dic objectForKey:@"shippingOrderNo"];
    NSString *name = [dic objectForKey:@"shippingOrderName"];
    YBAlertCell *cell = [YBAlertCell alertCellWithNum:num GoodsName:name];
    cell.bottomSegmentLine.backgroundColor = [UIColor clearColor];
    if (indexPath.row == 0) {
        cell.topSegmentLine.backgroundColor = [UIColor clearColor];
    }
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 25;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 25;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    YBAlertCell *header = [YBAlertCell alertCellWithNum:@"订单号" GoodsName:@"物品名称"];
    header.topSegmentLine.hidden = YES;
    header.orderNumLabel.textAlignment = NSTextAlignmentCenter;
    header.goodsNameLabel.textAlignment = NSTextAlignmentCenter;
    return header;
}

#pragma mark- response event
- (void)clickButton:(UIButton *)sender
{
    if (_delegate && [_delegate respondsToSelector:@selector(alertView:handleEvent:)]) {
        [_delegate alertView:self handleEvent:sender.tag];
        [[[UIApplication sharedApplication].keyWindow viewWithTag:AlertViewTag] removeFromSuperview];
    }
    if (self.block) {
        self.block(sender.tag);
        [[[UIApplication sharedApplication].keyWindow viewWithTag:AlertViewTag] removeFromSuperview];
    }
}

#pragma mark- privat

- (void)layoutSubPages {
    [self.alertView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.centerY.equalTo(self.mas_centerY);
        make.width.equalTo(@(300));
        make.height.equalTo(@([self alertHeight]));
    }];

    [self.verticalLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.alertView.mas_centerX);
        make.bottom.offset(0);
        make.width.equalTo(@(1));
        make.height.equalTo(@(49));
    }];
    
    [self.yesButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.offset(0);
        make.left.offset(0);
        make.right.equalTo(self.verticalLine.mas_left);
        make.height.equalTo(@(49));
    }];
    
    [self.noButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.offset(0);
        make.right.offset(0);
        make.left.equalTo(self.verticalLine.mas_right);
        make.height.equalTo(@(49));
    }];
    
    [self.horizontalLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.right.offset(0);
        make.bottom.equalTo(self.yesButton.mas_top);
        make.height.equalTo(@(1));
    }];
    
    [self.tipsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.horizontalLine.mas_top);
        make.left.offset(0);
        make.right.offset(0);
        make.height.equalTo(@(self.tips == nil ? 0 : 100));
    }];
    
    [self.contentList mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.tipsLabel.mas_top);
        make.left.offset(5);
        make.right.offset(-6);
        make.height.equalTo(@([self listHeight]));
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentList.mas_top);
        make.left.offset(0);
        make.right.offset(0);
        make.top.offset(0);
    }];
}
- (void)addHUDConstraints
{
    [self.hudView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.centerY.equalTo(self.mas_centerY);
        make.width.equalTo(@(300));
        make.height.equalTo(@(hudViewH));
    }];
    [self.hudLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.offset(0);
        make.left.offset(0);
        make.centerX.equalTo(self.mas_centerX);
        make.height.equalTo(@(hudViewH));
    }];
    [self.hudIndicator mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.hudLabel.mas_top).offset(30);
        make.height.equalTo(@(20));
        make.centerX.equalTo(self.hudLabel.mas_centerX);
        make.width.equalTo(@(20));
    }];
}
- (void)addErrConstraints
{
    [self.errLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.offset(0);
        make.left.offset(0);
        make.centerX.equalTo(self.mas_centerX);
        make.height.equalTo(@(hudViewH));
    }];
}

- (CGFloat)alertHeight {
    if (self.title == nil) {
        return 100 + 50 +[self listHeight];
    }else{
        //98只有tips时的高度 title区域高度50 表头高度：50  行高：25
      return 100 + 50 + 50 +[self listHeight];
    }
}

- (CGFloat)listHeight {
    if (self.lists.count == 0) {
        return  0;
    } else if (self.lists.count <= 3) {
        return 25+self.lists.count*25;
    } else {
        return 25 + 3 * 25;
    }
}

#pragma mark- getter
- (UIView *)alertView {
    if (_alertView == nil) {
        _alertView = [[UIView alloc] init];
        _alertView.backgroundColor = [UIColor whiteColor];
    }
    return _alertView;
}

- (UIButton *)yesButton {
    if (_yesButton == nil) {
        _yesButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_yesButton setTitle:@"否" forState:UIControlStateNormal];
        [_yesButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _yesButton.tag = YBAlertViewEventNO;
        [_yesButton addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _yesButton;
}

- (UIView *)verticalLine {
    if (_verticalLine == nil) {
        _verticalLine = [[UIView alloc] init];
        _verticalLine.backgroundColor = [UIColor colorFromHex:@"#d4d4d4"];
    }
    return _verticalLine;
}

- (UIButton *)noButton {
    if (_noButton == nil) {
        _noButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_noButton setTitle:@"是" forState:UIControlStateNormal];
        [_noButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        _noButton.tag = YBAlertViewEventYES;
        [_noButton addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _noButton;
}

- (UIView *)horizontalLine {
    if (_horizontalLine == nil) {
        _horizontalLine = [[UIView alloc] init];
        _horizontalLine.backgroundColor = [UIColor colorFromHex:@"#d4d4d4"];
    }
    return _horizontalLine;
}

- (UILabel *)tipsLabel {
    if (_tipsLabel == nil) {
        _tipsLabel = [[UILabel alloc] init];
        _tipsLabel.textAlignment = NSTextAlignmentCenter;
        _tipsLabel.text = self.tips;
        _tipsLabel.font = [UIFont systemFontOfSize:18];
    }
    return _tipsLabel;
}

#

- (UITableView *)contentList {
    if (_contentList == nil) {
        _contentList = [[UITableView alloc] init];
        _contentList.backgroundColor = [UIColor colorFromHex:@"#efefef"];
        _contentList.delegate = self;
        _contentList.dataSource = self;
        _contentList.separatorColor = [UIColor colorFromHex:@"#efefef"];
        _contentList.separatorStyle = UITableViewCellSeparatorStyleNone;
        _contentList.allowsSelection = NO;
    }
    return _contentList;
}

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.text = self.title;
        _titleLabel.font = [UIFont systemFontOfSize:18];
    }
    return _titleLabel;
}
- (UIView *)hudView
{
    if (!_hudView) {
        _hudView = [[UIView alloc] init];
        _hudView.backgroundColor = [UIColor whiteColor];
        _hudView.layer.cornerRadius = 2;
        _hudView.layer.masksToBounds = YES;
    }
    return _hudView;
}
- (UILabel *)hudLabel
{
    if (!_hudLabel) {
        _hudLabel = [[UILabel alloc] init];
        _hudLabel.font = [UIFont systemFontOfSize:18];
        _hudLabel.numberOfLines = 0;
        _hudLabel.text = [NSString stringWithFormat:@"\n\n%@", self.hint];
        _hudLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _hudLabel;
}
- (UIActivityIndicatorView *)hudIndicator
{
    if (!_hudIndicator) {
        _hudIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [_hudIndicator startAnimating];
    }
    return _hudIndicator;
}
- (UILabel *)errLabel
{
    if (!_errLabel) {
        _errLabel = [[UILabel alloc] init];
        _errLabel.font = [UIFont systemFontOfSize:18];
        _errLabel.numberOfLines = 0;
        _errLabel.text = [NSString stringWithFormat:@"%@", self.errorStr];
        _errLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _errLabel;
}


@end

@interface YBAlertCell()

@end
@implementation YBAlertCell

+ (instancetype)alertCellWithNum:(NSString *)num GoodsName:(NSString *)name
{
    YBAlertCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"YBAlertCell" owner:nil options:nil] firstObject];
    cell.orderNumLabel.text = num;
    cell.goodsNameLabel.text = name;
    cell.goodsNameLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    cell.midSegmentLine.backgroundColor = [UIColor colorFromHex:@"#d4d4d4"];
    cell.topSegmentLine.backgroundColor = [UIColor colorFromHex:@"#d4d4d4"];
    cell.bottomSegmentLine.backgroundColor = [UIColor colorFromHex:@"#d4d4d4"];
    cell.backgroundColor = [UIColor colorFromHex:@"#efefef"];
    return cell;
}

@end
