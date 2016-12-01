//
//  YBAddressTextField.m
//  urlsession
//
//  Created by apple on 2016/11/28.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "YBAddressTextField.h"

@interface YBAddressTextField()<UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, strong)NSArray *fileArr;
@property (nonatomic, assign)NSInteger provinceRow;
@property (nonatomic, assign)NSInteger cityRow;
@property (nonatomic, assign)NSInteger districtRow;
@property (nonatomic, strong)NSString *provinceStr;
@property (nonatomic, strong)NSString *cityStr;
@property (nonatomic, strong)NSString *districtStr;

@end

@implementation YBAddressTextField

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}
- (void)setup {
    UIPickerView *inputPickerView = [[UIPickerView alloc] init];  // 创建UIPickerView对象
    inputPickerView.delegate = self;  // 让ESFlagTextField成为inputPickerView的代理
    inputPickerView.dataSource = self;  // 让ESFlagTextField成为inputPickerView的数据源
    
    // 修改键盘弹出的类型
    self.inputView = inputPickerView;
    
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44)];
    toolbar.backgroundColor = [UIColor orangeColor];
    UIBarButtonItem *cancelBtn = [[UIBarButtonItem alloc] initWithTitle:@"cancel" style:UIBarButtonItemStyleDone target:self action:@selector(doneBtnClick)];
    UIBarButtonItem *flex = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc] initWithTitle:@"done" style:UIBarButtonItemStyleDone target:self action:@selector(doneBtnClick)];
    toolbar.items = @[cancelBtn,flex,doneBtn];
    
    self.inputAccessoryView = toolbar;
    
    NSString *file = [[NSBundle mainBundle] pathForResource:@"Province" ofType:@"plist"];
    _fileArr = [NSArray arrayWithContentsOfFile:file];
    
//    [inputPickerView selectRow:0 inComponent:0 animated:YES];
}
- (void)doneBtnClick {
    [self endEditing:YES];
}

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 3;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
        return _fileArr.count;
        
    } else if (component == 1) {
        return [_fileArr[_provinceRow][@"citys"] count];
        
    } else {
        return [_fileArr[_provinceRow][@"citys"][_cityRow][@"districts"] count];
        
    }
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (component == 0) {
        _provinceStr = _fileArr[row][@"province"];
        self.text = [self combineStr];
        return _fileArr[row][@"province"];
    } else if(component == 1) {
        _cityStr = _fileArr[_provinceRow][@"citys"][row][@"city"];
        self.text = [self combineStr];
        return _fileArr[_provinceRow][@"citys"][row][@"city"];
    } else {
        _districtStr = _fileArr[_provinceRow][@"citys"][_cityRow][@"districts"][row];
        self.text = [self combineStr];
        return _fileArr[_provinceRow][@"citys"][_cityRow][@"districts"][row];
    }
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (component == 0) {
        _provinceRow = row;
        [pickerView reloadComponent:1];
        [pickerView reloadComponent:2];
    } else if(component == 1) {
        _cityRow = row;
        [pickerView reloadComponent:2];
    } else if(component == 2) {
        _districtRow = row;
        [pickerView reloadComponent:2];
    }
}
- (NSString *)combineStr {
    return [NSString stringWithFormat:@"%@%@%@", _provinceStr, _cityStr, _districtStr];
}

@end
