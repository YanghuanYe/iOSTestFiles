//
//  YHViewsMaker.h
//  urlsession
//
//  Created by apple on 2016/11/30.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import <UIKit/UIKit.h>

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface YHViewsMaker : NSObject

+ (UIButton *)makeBtnWithFontSie:(NSInteger)fontSize titleColor:(UIColor *)color selectedColor:(UIColor *)selectedColor name:(NSString *)btnName imageName:(NSString *)imgName selectedImageName:(NSString *)selectedImageName tag:(NSInteger)tag;

@end

//垂直view
@interface YHVertorlBtn : UIButton

@end

