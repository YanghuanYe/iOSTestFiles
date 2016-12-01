//
//  TableViewCell2.m
//  urlsession
//
//  Created by apple on 2016/11/30.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "TableViewCell2.h"
#import <Masonry.h>

@interface TableViewCell2()

@property (nonatomic, strong)UILabel *remarksLabel;
@property (nonatomic, strong)UIView *btnBackgroundView;

@end


@implementation TableViewCell2

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addViews];
        [self layoutViews];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}
- (void)addViews {
    _remarksLabel = [[UILabel alloc] init];
    _remarksLabel.text = @"备注";
    [self.contentView addSubview:_remarksLabel];
    _btnBackgroundView = [[UIView alloc] init];
    [self.contentView addSubview:_btnBackgroundView];
    _btnBackgroundView.layer.borderColor= [UIColor blackColor].CGColor;
    _btnBackgroundView.layer.borderWidth = 1;
    _frangibleBtn = [self makeBtnWithFontSie:12 titleColor:[UIColor blackColor] selectedColor:[UIColor orangeColor] name:@"易碎" imageName:@"易碎  未选中  ico" selectedImageName:@"易碎  已选中 ico" tag:60];
    [_frangibleBtn addTarget:self action:@selector(btnClickToModifyRemarks:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_frangibleBtn];
    _dampproofBtn = [self makeBtnWithFontSie:12 titleColor:[UIColor blackColor] selectedColor:[UIColor orangeColor] name:@"防潮" imageName:@"易碎  未选中  ico" selectedImageName:@"易碎  已选中 ico" tag:61];
    [_dampproofBtn addTarget:self action:@selector(btnClickToModifyRemarks:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_dampproofBtn];
    _fireproofBtn = [self makeBtnWithFontSie:12 titleColor:[UIColor blackColor] selectedColor:[UIColor orangeColor] name:@"防火" imageName:@"易碎  未选中  ico" selectedImageName:@"易碎  已选中 ico" tag:62];
    [_fireproofBtn addTarget:self action:@selector(btnClickToModifyRemarks:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_fireproofBtn];
    _notPressBtn = [self makeBtnWithFontSie:12 titleColor:[UIColor blackColor] selectedColor:[UIColor orangeColor] name:@"轻放勿压" imageName:@"易碎  未选中  ico" selectedImageName:@"易碎  已选中 ico" tag:63];
    [_notPressBtn addTarget:self action:@selector(btnClickToModifyRemarks:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_notPressBtn];
}
- (void)btnClickToModifyRemarks:(UIButton *)btn {
    btn.selected = !btn.selected;
    if (btn.selected) {
        switch (btn.tag) {
            case 60:
                [_remarksArr addObject:@"frangible"];
                break;
            case 61:
                [_remarksArr addObject:@"dampproof"];
                break;
            case 62:
                [_remarksArr addObject:@"fireproof"];
                break;
            case 63:
                [_remarksArr addObject:@"notPress"];
                break;
            default:
                break;
        }
    } else {
        switch (btn.tag) {
            case 60:
                [_remarksArr removeObject:@"frangible"];
                break;
            case 61:
                [_remarksArr removeObject:@"dampproof"];
                break;
            case 62:
                [_remarksArr removeObject:@"fireproof"];
                break;
            case 63:
                [_remarksArr removeObject:@"notPress"];
                break;
            default:
                break;
        }
    }
}
- (NSMutableArray *)remarksArr {
    if (!_remarksArr) {
        _remarksArr = [NSMutableArray array];
    }
    return _remarksArr;
}
- (void)layoutViews {
    [_remarksLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self.contentView).offset(10);
    }];
    [_btnBackgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_remarksLabel.mas_bottom).offset(10);
        make.left.equalTo(_remarksLabel);
        make.right.equalTo(self.contentView).offset(-10);
        make.height.equalTo(@40);
        make.bottom.equalTo(self.contentView).offset(-10);
    }];
    CGFloat width = ([UIScreen mainScreen].bounds.size.width - 20) / 4;
    [_frangibleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.height.equalTo(_btnBackgroundView);
        make.width.mas_equalTo(width);
    }];
    [_dampproofBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_frangibleBtn.mas_right);
        make.top.height.equalTo(_btnBackgroundView);
        make.width.mas_equalTo(width);
    }];
    [_fireproofBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_dampproofBtn.mas_right);
        make.top.height.equalTo(_btnBackgroundView);
        make.width.mas_equalTo(width);
    }];
    [_notPressBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_fireproofBtn.mas_right);
        make.top.height.equalTo(_btnBackgroundView);
        make.width.mas_equalTo(width);
    }];
}
- (UIButton *)makeBtnWithFontSie:(NSInteger)fontSize titleColor:(UIColor *)color selectedColor:(UIColor *)selectedColor name:(NSString *)btnName imageName:(NSString *)imgName selectedImageName:(NSString *)selectedImageName tag:(NSInteger)tag {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    if (fontSize != 0) {
        btn.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    }
    if (btnName != nil) {
        [btn setTitle:btnName forState:UIControlStateNormal];
    }
    if (imgName != nil) {
        [btn setImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
    }
    if (color != nil) {
        [btn setTitleColor:color forState:UIControlStateNormal];
    }
    if (selectedColor != nil) {
        [btn setTitleColor:selectedColor forState:UIControlStateSelected];
    }
    if (selectedImageName != nil) {
        [btn setImage:[UIImage imageNamed:selectedImageName] forState:UIControlStateNormal];
    }
    if (tag != 0) {
        btn.tag = tag;
    }
    return btn;
}

@end
