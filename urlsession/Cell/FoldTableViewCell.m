//
//  FoldTableViewCell.m
//  urlsession
//
//  Created by apple on 2016/12/1.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "FoldTableViewCell.h"
#import <Masonry.h>
#import "YHViewsMaker.h"

@interface FoldTableViewCell()

@property (nonatomic, strong)UIButton *unfoldBtn;
@property (nonatomic, strong)UILabel *showLabel;

@end

@implementation FoldTableViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addViews];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}
- (void)update {
    
    [_unfoldBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.contentView).offset(10);
        make.bottom.equalTo(_showLabel.mas_top).offset(-20);
    }];
    [_showLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_unfoldBtn.mas_bottom).offset(20);
        make.left.equalTo(self.contentView).offset(10);
        make.bottom.equalTo(self.contentView).offset(-10);
        make.height.mas_equalTo(@30);
    }];
    [self.contentView setNeedsDisplay];
    [self.contentView layoutIfNeeded];
    [self.contentView updateConstraintsIfNeeded];
}
- (void)addViews {
    _unfoldBtn = [YHViewsMaker makeButtonWithFontSie:14 titleColor:nil selectedColor:nil highlightedColor:[UIColor orangeColor] name:@"button" imageName:nil selectedImageName:nil tag:0];
    _unfoldBtn.backgroundColor = [UIColor blueColor];
    [_unfoldBtn addTarget:self action:@selector(unfold) forControlEvents:UIControlEventTouchUpInside];
    _showLabel = [YHViewsMaker makeLabelWithFontSie:14 textColor:nil name:@"label" labelTextAlignment:0];
    _showLabel.backgroundColor = [UIColor yellowColor];
    [YHViewsMaker addSubViews:@[_unfoldBtn, _showLabel] toSuperView:self.contentView];
}
- (void)layoutViews {
}
- (void)unfold {
    if (_delegate && [_delegate respondsToSelector:@selector(foldCellWillBeUnfolded:)]) {
        [_delegate foldCellWillBeUnfolded:self.indexPath];
    }
}
- (void)setButtonName:(NSString *)buttonName {
    [_unfoldBtn setTitle:buttonName forState:UIControlStateNormal];
}
- (void)setLabelName:(NSString *)labelName {
    _showLabel.text = labelName;
}
- (void)setType:(FoldTableViewCellType)type {
    _type = type;
    __block MASConstraint *con1, *con2, *con3, *con4;
    if (type == FoldTableViewCellTypeFold) {
//        [_unfoldBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.top.equalTo(self.contentView).offset(10);
//            make.bottom.equalTo(self.contentView).offset(-10);
//        }];
        [_unfoldBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(self.contentView).offset(10);
            make.bottom.equalTo(self.contentView).offset(-10);
        }];
//        [con1 deactivate];
//        [con2 deactivate];
//        [con3 deactivate];
//        [con4 deactivate];
        self.contentView.backgroundColor = [UIColor lightGrayColor];
    }
    if (type == FoldTableViewCellTypeUnfold) {
//        [_unfoldBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.top.equalTo(self.contentView).offset(10);
//            make.bottom.equalTo(_showLabel.mas_top).offset(-20);
//        }];
        [_unfoldBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(self.contentView).offset(10);
            make.bottom.equalTo(_showLabel.mas_top).offset(-20);
        }];
        [_showLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            con1 = make.top.equalTo(_unfoldBtn.mas_bottom).offset(20);
            con2 = make.left.equalTo(self.contentView).offset(10);
            con3 = make.bottom.equalTo(self.contentView).offset(-10);
            con4 = make.height.mas_equalTo(@30);
        }];
        self.contentView.backgroundColor = [UIColor clearColor];
//        [self.contentView setNeedsDisplay];
//        [self.contentView layoutIfNeeded];
//        [self.contentView updateConstraintsIfNeeded];
    }
}

@end
