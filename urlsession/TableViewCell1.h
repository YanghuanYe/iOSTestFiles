//
//  TableViewCell1.h
//  urlsession
//
//  Created by apple on 2016/11/28.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YBAddressTextField.h"

@interface TableViewCell1 : UITableViewCell

@property (nonatomic, strong)UITextField *nameTextField;
@property (nonatomic, strong)UITextField *phoneTextField;
@property (nonatomic, strong)YBAddressTextField *addressTextField;
@property (nonatomic, strong)UITextView *detailedAddressTextField;

@end
