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
//        [self layoutViews];
        if (self.type == FoldTableViewCellTypeFold) {
            self.type = FoldTableViewCellTypeFold;
        }
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
    _unfoldBtn = [YHViewsMaker makeButtonWithFontSie:14 titleColor:nil selectedColor:nil highlightedColor:[UIColor orangeColor] name:@"unfoldCell" imageName:nil selectedImageName:nil tag:0];
    [_unfoldBtn addTarget:self action:@selector(unfold) forControlEvents:UIControlEventTouchUpInside];
    _showLabel = [YHViewsMaker makeLabelWithFontSie:14 textColor:nil name:@"unfold!" labelTextAlignment:0];
    [YHViewsMaker addSubViews:@[_unfoldBtn, _showLabel] toSuperView:self.contentView];
}
- (void)layoutViews {
//    [_unfoldBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.top.equalTo(self.contentView).offset(10);
//        make.bottom.equalTo(self.contentView).offset(-10);
//    }];
}
- (void)unfold {
    if (_delegate && [_delegate respondsToSelector:@selector(foldCellWillBeUnfolded:)]) {
        [_delegate foldCellWillBeUnfolded:self.indexPath];
    }
    self.type = FoldTableViewCellTypeUnfold;
}
- (void)setType:(FoldTableViewCellType)type {
    _type = type;
    if (type == FoldTableViewCellTypeFold) {
//        [_unfoldBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.top.equalTo(self.contentView).offset(10);
//            make.bottom.equalTo(self.contentView).offset(-10);
//        }];
        [_unfoldBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(self.contentView).offset(10);
            make.bottom.equalTo(self.contentView).offset(-10);
        }];
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
            make.top.equalTo(_unfoldBtn.mas_bottom).offset(20).priority(MASLayoutPriorityDefaultMedium);
            make.left.equalTo(self.contentView).offset(10);
            make.bottom.equalTo(self.contentView).offset(-10).priority(MASLayoutPriorityDefaultMedium);
            make.height.mas_equalTo(@30);
        }];
//        [self.contentView setNeedsDisplay];
//        [self.contentView layoutIfNeeded];
//        [self.contentView updateConstraintsIfNeeded];
    }
}

@end
