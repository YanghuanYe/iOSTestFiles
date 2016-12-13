//
//  ConditionsView.m
//  urlsession
//
//  Created by apple on 2016/12/8.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "ConditionsView.h"
#import <Masonry.h>
#import "YHViewsMaker.h"

@interface ConditionsView()

@property (nonatomic, strong)UIView *view1;
@property (nonatomic, strong)UILabel *view1Label;
@property (nonatomic, strong)UIButton *view1Button1;
@property (nonatomic, strong)UIButton *view1Button2;
@property (nonatomic, strong)UIButton *view1Button3;

@end

@implementation ConditionsView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        [self addViews];
    }
    return self;
}

- (void)addViews {
    _view1 = [[UIView alloc] init];
    _view1.backgroundColor = [UIColor whiteColor];
    [self addSubview:_view1];
    _view1Label = [YHViewsMaker makeLabelWithFontSie:14 textColor:nil name:@"color" labelTextAlignment:0];
    [_view1 addSubview:_view1Label];
    _view1Button1 = [YHViewsMaker makeButtonWithFontSie:14 titleColor:nil selectedColor:[UIColor orangeColor] highlightedColor:nil name:@"red" imageName:nil selectedImageName:nil tag:10];
    _view1Button2 = [YHViewsMaker makeButtonWithFontSie:14 titleColor:nil selectedColor:[UIColor orangeColor] highlightedColor:nil name:@"blue" imageName:nil selectedImageName:nil tag:11];
    _view1Button3 = [YHViewsMaker makeButtonWithFontSie:14 titleColor:nil selectedColor:[UIColor orangeColor] highlightedColor:nil name:@"green" imageName:nil selectedImageName:nil tag:12];
    [YHViewsMaker addSubViews:@[_view1Button1, _view1Button2, _view1Button3] toSuperView:_view1];
}
- (void)layoutViews {
    [_view1Label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(_view1).offset(10);
        make.right.equalTo(_view1).offset(-10);
    }];
    
}

@end
