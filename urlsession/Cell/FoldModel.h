//
//  FoldModel.h
//  urlsession
//
//  Created by apple on 2016/12/5.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FoldTableViewCell.h"

@interface FoldModel : NSObject

@property (nonatomic, strong)NSString *buttonName;
@property (nonatomic, strong)NSString *labelName;
@property (nonatomic, assign)FoldTableViewCellType type;

+ (instancetype)newWithBtnName:(NSString *)btnN LaName:(NSString *)laName type:(FoldTableViewCellType)type;

@end
