//
//  FoldModel.m
//  urlsession
//
//  Created by apple on 2016/12/5.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "FoldModel.h"

@implementation FoldModel

+ (instancetype)newWithBtnName:(NSString *)btnN LaName:(NSString *)laName type:(FoldTableViewCellType)type {
    FoldModel *s = [[FoldModel alloc] init];
    s.buttonName = btnN;
    s.labelName = laName;
    s.type = type;
    return s;
}

@end
