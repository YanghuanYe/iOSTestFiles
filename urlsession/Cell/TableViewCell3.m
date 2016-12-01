//
//  TableViewCell3.m
//  urlsession
//
//  Created by apple on 2016/12/1.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "TableViewCell3.h"
#import "YHViewsMaker.h"
#import <Masonry.h>

@interface TableViewCell3()

@property (nonatomic, strong)UILabel *receiveGoodsLabel;
@property (nonatomic, strong)UILabel *postGoodsLabel;
@property (nonatomic, strong)UIView *receiveGoodsLine;
@property (nonatomic, strong)UIButton *receiveGoodsSelectBtn;
@property (nonatomic, strong)UIButton *postGoodsSelectBtn;

@property (nonatomic, strong)UIButton *receiveGoodsAtHomeBtn;
@property (nonatomic, strong)UIButton *receiveGoodsCustomerPersonallyBtn;
@property (nonatomic, strong)UIButton *getGoodsAtHomeBtn;
@property (nonatomic, strong)UIButton *getGoodsInOfficeBtn;

@end

@implementation TableViewCell3

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addViews];
        [self layoutViews];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}
- (void)addViews {
    _receiveGoodsLabel = [YHViewsMaker makeLabelWithFontSie:14 textColor:nil name:@"接货方式" labelTextAlignment:0];
    _postGoodsLabel = [YHViewsMaker makeLabelWithFontSie:14 textColor:nil name:@"送货方式" labelTextAlignment:0];
    [YHViewsMaker addSubViews:@[_receiveGoodsLabel, _postGoodsLabel] toSuperView:self.contentView];
    _receiveGoodsAtHomeBtn = [YHViewsMaker makeButtonWithFontSie:12 titleColor:nil selectedColor:[UIColor orangeColor] highlightedColor:[UIColor orangeColor] name:@"上门提货" imageName:nil selectedImageName:nil tag:60];
    _receiveGoodsCustomerPersonallyBtn = [YHViewsMaker makeButtonWithFontSie:12 titleColor:nil selectedColor:[UIColor orangeColor] highlightedColor:[UIColor orangeColor] name:@"客户自送" imageName:nil selectedImageName:nil tag:61];
    _getGoodsAtHomeBtn = [YHViewsMaker makeButtonWithFontSie:12 titleColor:nil selectedColor:[UIColor orangeColor] highlightedColor:[UIColor orangeColor] name:@"送货上门" imageName:nil selectedImageName:nil tag:62];
    _getGoodsInOfficeBtn = [YHViewsMaker makeButtonWithFontSie:12 titleColor:nil selectedColor:[UIColor orangeColor] highlightedColor:[UIColor orangeColor] name:@"到场自提" imageName:nil selectedImageName:nil tag:63];
    [YHViewsMaker makeBorderToViews:@[_receiveGoodsAtHomeBtn, _receiveGoodsCustomerPersonallyBtn, _getGoodsAtHomeBtn, _getGoodsInOfficeBtn] borderWidth:1 borderColor:[UIColor grayColor].CGColor cornerRadius:5];
    for (UIButton *btn in @[_receiveGoodsAtHomeBtn, _receiveGoodsCustomerPersonallyBtn, _getGoodsAtHomeBtn, _getGoodsInOfficeBtn]) {
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    [YHViewsMaker addSubViews:@[_receiveGoodsAtHomeBtn,_receiveGoodsCustomerPersonallyBtn,_getGoodsAtHomeBtn,_getGoodsInOfficeBtn] toSuperView:self.contentView];
    [_receiveGoodsAtHomeBtn sendActionsForControlEvents:UIControlEventTouchUpInside];
    [_getGoodsAtHomeBtn sendActionsForControlEvents:UIControlEventTouchUpInside];
    _receiveGoodsLine = [[UIView alloc] init];
    _receiveGoodsLine.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:_receiveGoodsLine];
}
- (void)btnClick:(UIButton *)btn {
    if (btn.tag == _receiveGoodsSelectBtn.tag) {
        return;
    }
    if (btn.tag == _postGoodsSelectBtn.tag) {
        return;
    }
    if (btn.tag == 60) {
        _receiveGoodsSelectBtn.selected = NO;
        _receiveGoodsSelectBtn = [self.contentView viewWithTag:btn.tag];
        _receiveGoodsAtHomeBtn.selected = YES;
        _receiveGoodsOption = @"receiveGoodsAtHome";
        return;
    } else if(btn.tag == 61) {
        _receiveGoodsSelectBtn.selected = NO;
        _receiveGoodsSelectBtn = [self.contentView viewWithTag:btn.tag];
        _receiveGoodsCustomerPersonallyBtn.selected = YES;
        _receiveGoodsOption = @"receiveGoodsCustomerPersonally";
        return;
    }
    if (btn.tag == 62) {
        _postGoodsSelectBtn.selected = NO;
        _postGoodsSelectBtn = [self.contentView viewWithTag:btn.tag];
        _getGoodsAtHomeBtn.selected = YES;
        _postGoodsOption = @"getGoodsAtHome";
        return;
    } else if(btn.tag == 63) {
        _postGoodsSelectBtn.selected = NO;
        _postGoodsSelectBtn = [self.contentView viewWithTag:btn.tag];
        _getGoodsInOfficeBtn.selected = YES;
        _postGoodsOption = @"getGoodsInOffice";
        return;
    }
}
- (void)layoutViews {
    [_receiveGoodsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self.contentView).offset(10);
    }];
    [_postGoodsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_receiveGoodsLabel.mas_bottom).offset(20);
        make.left.equalTo(_receiveGoodsLabel);
        make.bottom.equalTo(self.contentView).offset(-10);
    }];
    [_receiveGoodsLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_receiveGoodsLabel.mas_bottom).offset(9.5);
        make.left.equalTo(self.contentView).offset(5);
        make.right.equalTo(self.contentView).offset(-5);
        make.height.equalTo(@1);
    }];
    [_receiveGoodsCustomerPersonallyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-10);
        make.centerY.equalTo(_receiveGoodsLabel.mas_centerY);
        make.width.equalTo(@60);
    }];
    [_receiveGoodsAtHomeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_receiveGoodsCustomerPersonallyBtn.mas_left);
        make.centerY.equalTo(_receiveGoodsLabel.mas_centerY);
        make.width.equalTo(@60);
    }];
    [_receiveGoodsLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_receiveGoodsLabel.mas_bottom).offset(9.5);
        make.left.equalTo(self.contentView).offset(5);
        make.right.equalTo(self.contentView).offset(-5);
        make.height.equalTo(@1);
    }];
    [_getGoodsInOfficeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-10);
        make.centerY.equalTo(_postGoodsLabel.mas_centerY);
        make.width.equalTo(@60);
    }];
    [_getGoodsAtHomeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_getGoodsInOfficeBtn.mas_left);
        make.centerY.equalTo(_postGoodsLabel.mas_centerY);
        make.width.equalTo(@60);
    }];
}

@end
