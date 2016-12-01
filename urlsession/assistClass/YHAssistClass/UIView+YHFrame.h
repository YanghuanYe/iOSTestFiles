//
//  UIView+YHFrame.h
//  urlsession
//
//  Created by yeyanghuan on 2016/11/30.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (YHFrame)

@property CGFloat xmg_width;
@property CGFloat xmg_height;
@property CGFloat xmg_x;
@property CGFloat xmg_y;
@property CGFloat xmg_centerX;
@property CGFloat xmg_centerY;
//+(instancetype)viewWithHexColor:(NSString *)hexString;

+ (instancetype)xmg_viewFromXib;

-(BOOL)xl_isShowInKeyWindow;

@end
