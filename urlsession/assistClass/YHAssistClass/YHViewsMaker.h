//
//  YHViewsMaker.h
//  urlsession
//
//  Created by yeyanghuan on 2016/11/30.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, labelTextAlignment) {
    labelTextAlignmentLeft = 108,
    labelTextAlignmentRight,
    labelTextAlignmentCenter,
};

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface YHViewsMaker : NSObject
//make label
+ (UILabel *)makeLabelWithFontSie:(NSInteger)fontSize textColor:(UIColor *)color name:(NSString *)labelName labelTextAlignment:(labelTextAlignment)textAlign;
//make button
+ (UIButton *)makeButtonWithFontSie:(NSInteger)fontSize titleColor:(UIColor *)color selectedColor:(UIColor *)selectedColor highlightedColor:(UIColor *)highlightedColor name:(NSString *)btnName imageName:(NSString *)imgName selectedImageName:(NSString *)selectedImageName tag:(NSInteger)tag;
// add views to superView
+ (void)addSubViews:(NSArray *)subviewsArr toSuperView:(UIView *)superView;
// make views border
+(void)makeBorderToViews:(NSArray *)subviewsArr borderWidth:(CGFloat)borderWidth borderColor:(CGColorRef)borderColor cornerRadius:(CGFloat)cornerRadius;
@end

//垂直button
@interface YHVertorlBtn : UIButton

@end

