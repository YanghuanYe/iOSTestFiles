//
//  TableViewCell2.h
//  urlsession
//
//  Created by apple on 2016/11/30.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell2 : UITableViewCell

@property (nonatomic, strong)UIButton *frangibleBtn;//易碎
@property (nonatomic, strong)UIButton *dampproofBtn;//防潮
@property (nonatomic, strong)UIButton *fireproofBtn;//防火
@property (nonatomic, strong)UIButton *notPressBtn;//轻放勿压

@property (nonatomic, strong)NSMutableArray *remarksArr;

@end
