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
/**
 *  make label 
 *  Warning:Color must be UIColor type or NSString type!
 */
+ (UILabel *)makeLabelWithFontSie:(NSInteger)fontSize textColor:(id)color name:(NSString *)labelName labelTextAlignment:(labelTextAlignment)textAlign;
//make button
/**
 * make simple property button 
 * Warning:Color must be UIColor type or NSString type!
 */
+ (UIButton *)makeButtonWithFontSie:(NSInteger)fontSize titleColor:(id)color selectedColor:(id)selectedColor name:(NSString *)btnName tag:(NSInteger)tag;
/**
 * make complex property button 
 * Warning:Color must be UIColor type or NSString type!
 */
+ (UIButton *)makeButtonWithFontSie:(NSInteger)fontSize titleColor:(id)color selectedColor:(id)selectedColor highlightedColor:(id)highlightedColor name:(NSString *)btnName imageName:(NSString *)imgName selectedImageName:(NSString *)selectedImageName tag:(NSInteger)tag;
// add views to superView
+ (void)addSubViews:(NSArray *)subviewsArr toSuperView:(UIView *)superView;
// make views border
+ (void)makeBorderToViews:(NSArray *)subviewsArr borderWidth:(CGFloat)borderWidth borderColor:(CGColorRef)borderColor cornerRadius:(CGFloat)cornerRadius;

/**
 * safe string method
 * if str.length == 0 return @"暂无"
 */
+ (NSString *)safeStringMethod:(NSString *)str;

@end

//垂直button
@interface YHVertorlBtn : UIButton

@end

