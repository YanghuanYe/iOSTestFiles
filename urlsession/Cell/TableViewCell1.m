//
//  TableViewCell1.m
//  urlsession
//
//  Created by apple on 2016/11/28.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "TableViewCell1.h"
#import <Masonry.h>
#import "YHViewsMaker.h"

@interface TableViewCell1()<UITextFieldDelegate, UITextViewDelegate>

@property (nonatomic, strong)UILabel *nameLabel;
@property (nonatomic, strong)UILabel *phoneLabel;
@property (nonatomic, strong)UILabel *addressLabel;
@property (nonatomic, strong)UILabel *detailedAddressLabel;
//@property (nonatomic, strong)UITextField *nameTextField;
//@property (nonatomic, strong)UITextField *phoneTextField;
//@property (nonatomic, strong)YBAddressTextField *addressTextField;
//@property (nonatomic, strong)UITextField *detailedAddressTextField;
@property (nonatomic, strong)UIButton *consignorButton;
@property (nonatomic, strong)NSString *nameStr;
@property (nonatomic, strong)NSString *phoneStr;
@property (nonatomic, strong)NSString *addressStr;
@property (nonatomic, strong)NSString *detailedAddressStr;
@property (nonatomic, strong)NSDictionary *receiverDic;

@end

@implementation TableViewCell1

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
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
    _nameLabel = [YHViewsMaker makeLabelWithFontSie:14 textColor:nil name:@"姓名" labelTextAlignment:labelTextAlignmentRight];
    _phoneLabel = [YHViewsMaker makeLabelWithFontSie:14 textColor:nil name:@"电话" labelTextAlignment:labelTextAlignmentRight];
    _addressLabel = [YHViewsMaker makeLabelWithFontSie:14 textColor:nil name:@"地址" labelTextAlignment:labelTextAlignmentRight];
    _detailedAddressLabel = [YHViewsMaker makeLabelWithFontSie:14 textColor:nil name:@"详细地址" labelTextAlignment:labelTextAlignmentRight];
    [self.contentView addSubview:_nameLabel];
    [self.contentView addSubview:_phoneLabel];
    [self.contentView addSubview:_addressLabel];
    [self.contentView addSubview:_detailedAddressLabel];
    _nameLabel.layer.borderColor = [UIColor blueColor].CGColor;
    _nameLabel.layer.borderWidth = 1;
    _nameTextField = [[UITextField alloc] init];
    _phoneTextField = [[UITextField alloc] init];
    _addressTextField = [[YBAddressTextField alloc] init];
    _detailedAddressTextField = [[UITextView alloc] init];
    [self.contentView addSubview:_nameTextField];
    [self.contentView addSubview:_phoneTextField];
    [self.contentView addSubview:_addressTextField];
    [self.contentView addSubview:_detailedAddressTextField];
    _nameTextField.placeholder = @"请输入";
    _phoneTextField.placeholder = @"请输入";
    _addressTextField.placeholder = @"请输入";
    _detailedAddressTextField.text = @"请输入详细地址";
    _detailedAddressTextField.layer.borderColor = [UIColor grayColor].CGColor;
    _detailedAddressTextField.layer.borderWidth = 1;
    _detailedAddressTextField.textColor = [UIColor grayColor];
    _nameTextField.textAlignment = NSTextAlignmentRight;
    _nameTextField.delegate = self;
    _phoneTextField.delegate = self;
    _addressTextField.delegate = self;
    _detailedAddressTextField.delegate = self;
    _nameTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    _nameTextField.keyboardType = UIKeyboardTypeDefault;
    _phoneTextField.keyboardType = UIKeyboardTypeNumberPad;
    _detailedAddressTextField.keyboardType = UIKeyboardTypeDefault;
    _nameTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    //在弹出的键盘上面加一个view来放置退出键盘的Done按钮
    UIToolbar * topView = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
    [topView setBarStyle:UIBarStyleDefault];
    UIBarButtonItem * btnSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    UIBarButtonItem * doneButton1 = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:nil];
    NSArray * buttonsArray = [NSArray arrayWithObjects:btnSpace, doneButton1, nil];
    [topView setItems:buttonsArray];
    [_detailedAddressTextField setInputAccessoryView:topView];
    
    
    _consignorButton = [YHVertorlBtn buttonWithType:UIButtonTypeCustom];
    [_consignorButton setTitle:@"发货人" forState:UIControlStateNormal];
    [_consignorButton setImage:[UIImage imageNamed:@"发货人通讯录 ico"] forState:UIControlStateNormal];
    [_consignorButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.contentView addSubview:_consignorButton];
    _consignorButton.titleLabel.font = [UIFont systemFontOfSize:14];
}
- (void)layoutViews {
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(20);
        make.left.equalTo(self.contentView).offset(10);
        make.width.equalTo(@(50));
        make.height.equalTo(@(30));
    }];
    [_phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_nameLabel.mas_bottom).offset(20);
        make.left.and.width.and.height.equalTo(_nameLabel);
    }];
    [_addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_phoneLabel.mas_bottom).offset(20);
        make.left.and.width.and.height.equalTo(_nameLabel);
    }];
    [_detailedAddressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_addressLabel.mas_bottom).offset(20);
        make.left.and.width.and.height.equalTo(_nameLabel);
    }];
    //    @property (nonatomic, strong)UIButton *consignorButton;
    [_nameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_nameLabel.mas_right).offset(10);
        make.width.equalTo(@(200));
        make.height.and.top.equalTo(_nameLabel);
    }];
    [_phoneTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.width.and.height.equalTo(_nameTextField);
        make.top.equalTo(_phoneLabel);
    }];
    [_addressTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.height.equalTo(_addressLabel);
        make.left.equalTo(_nameTextField);
        make.width.equalTo(@(300));
    }];
    [_detailedAddressTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.width.equalTo(_addressTextField);
        make.height.equalTo(@80);
        make.top.equalTo(_detailedAddressLabel);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-10);
    }];
    [_consignorButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_nameTextField.mas_right).offset(10);
        make.right.equalTo(self.contentView).offset(-10);
        make.top.equalTo(self.contentView).offset(10+10);
        make.bottom.equalTo(_phoneTextField.mas_bottom).offset(-10);
    }];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField {
    _nameStr = _nameTextField.text;
    _phoneStr = _phoneTextField.text;
    _addressStr = _addressTextField.text;
    _detailedAddressStr = _detailedAddressTextField.text;
    _receiverDic = @{};
}
- (void)textViewDidEndEditing:(UITextView *)textView {
    if (textView.text.length < 1) {
        textView.text = @"请输入详细地址";
        textView.textColor = [UIColor grayColor];
    }
}
- (void)textViewDidBeginEditing:(UITextView *)textView {
    if ([textView.text isEqualToString:@"请输入详细地址"]) {
        textView.text = @"";
        textView.textColor = [UIColor blackColor];
    }
}

@end
