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

//- (instancetype)initWithFrame:(CGRect)frame {
//    if (self = [super initWithFrame:frame]) {
//        [self addViews];
//        self.selectionStyle = UITableViewCellSelectionStyleNone;
//    }
//    return self;
//}
//- (instancetype)init {
//    if (self = [super init]) {
//        [self addViews];
//        self.selectionStyle = UITableViewCellSelectionStyleNone;
//    }
//    return self;
//}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addViews];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}
- (void)addViews {
//    _unfoldBtn = [YHViewsMaker makeButtonWithFontSie:14 titleColor:nil selectedColor:nil highlightedColor:[UIColor orangeColor] name:@"button" imageName:nil selectedImageName:nil tag:0];
//    _unfoldBtn.backgroundColor = [UIColor blueColor];
//    [_unfoldBtn addTarget:self action:@selector(unfold) forControlEvents:UIControlEventTouchUpInside];
//    _showLabel = [YHViewsMaker makeLabelWithFontSie:14 textColor:nil name:@"label" labelTextAlignment:0];
//    _showLabel.backgroundColor = [UIColor yellowColor];
//    [YHViewsMaker addSubViews:@[_unfoldBtn, _showLabel] toSuperView:self.contentView];
    [YHViewsMaker addSubViews:@[self.unfoldBtn, self.showLabel] toSuperView:self.contentView];
}
- (UIButton *)unfoldBtn {
    if (!_unfoldBtn) {
        _unfoldBtn = [YHViewsMaker makeButtonWithFontSie:14 titleColor:nil selectedColor:nil highlightedColor:[UIColor orangeColor] name:@"button" imageName:nil selectedImageName:nil tag:0];
        _unfoldBtn.backgroundColor = [UIColor brownColor];
        [_unfoldBtn addTarget:self action:@selector(unfold) forControlEvents:UIControlEventTouchUpInside];
    }
    return _unfoldBtn;
}
- (UILabel *)showLabel {
    if (!_showLabel) {
        _showLabel = [YHViewsMaker makeLabelWithFontSie:14 textColor:nil name:@"label" labelTextAlignment:0];
        _showLabel.backgroundColor = [UIColor yellowColor];
    }
    return _showLabel;
}
- (void)unfold {
    if (_delegate && [_delegate respondsToSelector:@selector(foldCellWillBeUnfolded:)]) {
        [_delegate foldCellWillBeUnfolded:self.indexPath];
    }
}
- (void)setButtonName:(NSString *)buttonName {
    [self.unfoldBtn setTitle:buttonName forState:UIControlStateNormal];
}
- (void)setLabelName:(NSString *)labelName {
    _showLabel.text = labelName;
}
- (void)setType:(FoldTableViewCellType)type {
//    [self addViews];
    _type = type;
    __block MASConstraint *con1, *con2, *con3, *con4;
    if (type == FoldTableViewCellTypeFold) {
        self.unfoldBtn.hidden = NO;
        self.showLabel.hidden = YES;
        [self.unfoldBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(self.contentView).offset(10);
            make.right.equalTo(self.contentView).offset(-10);
            make.bottom.equalTo(self.contentView).offset(-10);
        }];
//        [con1 deactivate];
//        [con2 deactivate];
//        [con3 deactivate];
//        [con4 deactivate];
        self.contentView.backgroundColor = [UIColor lightGrayColor];
        
//        [self setNeedsUpdateConstraints];
//        [self setNeedsDisplay];
//        [self layoutIfNeeded];
    }
    if (type == FoldTableViewCellTypeUnfold) {
        self.unfoldBtn.hidden = NO;
        self.showLabel.hidden = NO;
        [self.unfoldBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(self.contentView).offset(10);
            make.right.equalTo(self.contentView).offset(-10);
            make.bottom.equalTo(_showLabel.mas_top).offset(-20);
        }];
        [self.showLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            con1 = make.top.equalTo(_unfoldBtn.mas_bottom).offset(20);
            con2 = make.left.equalTo(self.contentView).offset(10);
            con3 = make.bottom.equalTo(self.contentView).offset(-10);
            con4 = make.height.mas_equalTo(@30);
        }];
        self.contentView.backgroundColor = [UIColor whiteColor];
//        [self setNeedsUpdateConstraints];
//        [self setNeedsDisplay];
//        [self layoutIfNeeded];
    }
}

@end
