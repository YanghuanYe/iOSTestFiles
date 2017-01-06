//
//  YHViewsMaker.m
//  urlsession
//
//  Created by yeyanghuan on 2016/11/30.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "YHViewsMaker.h"
#import "UIView+YHFrame.h"
#import "UIColor+ZSB.h"

@implementation YHViewsMaker

+ (UILabel *)makeLabelWithFontSie:(NSInteger)fontSize textColor:(id)color name:(NSString *)labelName labelTextAlignment:(labelTextAlignment)textAlign {
    UILabel *label = [[UILabel alloc] init];
    if (fontSize != 0) {
        label.font = [UIFont systemFontOfSize:fontSize];
    }
    if (color != nil) {
        if ([color isKindOfClass:[UIColor class]]) {
            label.textColor = color;
        } else if([color isKindOfClass:[NSString class]]) {
            label.textColor = [self YHColorFromHex:color alpha:1.0];
        }
    }
    label.text = labelName;
    if (textAlign == labelTextAlignmentLeft) {
        label.textAlignment = NSTextAlignmentLeft;
    } else if(textAlign == labelTextAlignmentRight) {
        label.textAlignment = NSTextAlignmentRight;
    } else if(textAlign == labelTextAlignmentCenter) {
        label.textAlignment = NSTextAlignmentCenter;
    }
    return label;
}
/*
    simple property button maker
 */
#pragma mark - simple property button maker
+ (UIButton *)makeButtonWithFontSie:(NSInteger)fontSize titleColor:(id)color selectedColor:(id)selectedColor name:(NSString *)btnName tag:(NSInteger)tag {
    return [self makeButtonWithFontSie:fontSize titleColor:color selectedColor:selectedColor highlightedColor:nil name:btnName imageName:nil selectedImageName:nil tag:tag];

}
/*
    complex property button maker
 */
+(UIButton *)makeButtonWithFontSie:(NSInteger)fontSize titleColor:(id)color selectedColor:(id)selectedColor highlightedColor:(id)highlightedColor name:(NSString *)btnName imageName:(NSString *)imgName selectedImageName:(NSString *)selectedImageName tag:(NSInteger)tag {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    if (fontSize != 0) {
        btn.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    }
    if (btnName != nil) {
        [btn setTitle:btnName forState:UIControlStateNormal];
    }
    if (imgName != nil) {
        [btn setImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
    }
    if (color != nil) {
        if ([color isKindOfClass:[UIColor class]]) {
            [btn setTitleColor:color forState:UIControlStateNormal];
        } else if([color isKindOfClass:[NSString class]]) {
            [btn setTitleColor:[self YHColorFromHex:color alpha:1.0] forState:UIControlStateNormal];
        }
    } else {
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    if (selectedColor != nil) {
        if ([selectedColor isKindOfClass:[UIColor class]]) {
            [btn setTitleColor:selectedColor forState:UIControlStateSelected];
        } else if([selectedColor isKindOfClass:[NSString class]]) {
            [btn setTitleColor:[self YHColorFromHex:selectedColor alpha:1.0] forState:UIControlStateSelected];
        }
    }
    if (highlightedColor != nil) {
        if ([highlightedColor isKindOfClass:[UIColor class]]) {
            [btn setTitleColor:highlightedColor forState:UIControlStateHighlighted];
        } else if([highlightedColor isKindOfClass:[NSString class]]) {
            [btn setTitleColor:[self YHColorFromHex:highlightedColor alpha:1.0] forState:UIControlStateHighlighted];
        }
    }
    if (selectedImageName != nil) {
        [btn setImage:[UIImage imageNamed:selectedImageName] forState:UIControlStateSelected];
    }
    if (tag != 0) {
        btn.tag = tag;
    }
    return btn;
}
+(void)addSubViews:(NSArray *)subviewsArr toSuperView:(UIView *)superView {
    if (subviewsArr.count == 0) {
        return;
    }
    for (UIView *subview in subviewsArr) {
        [superView addSubview:subview];
    }
}
+(void)makeBorderToViews:(NSArray *)subviewsArr borderWidth:(CGFloat)borderWidth borderColor:(CGColorRef)borderColor cornerRadius:(CGFloat)cornerRadius {
    if (subviewsArr.count == 0) {
        return;
    }
    for (UIView *subview in subviewsArr) {
        subview.layer.borderWidth = borderWidth;
        subview.layer.borderColor = borderColor;
        if (cornerRadius != 0) {
            subview.layer.cornerRadius = cornerRadius;
            subview.layer.masksToBounds = YES;
        }
    }
}

#pragma mark - Color From NSString To UIColor
+ (UIColor*)YHColorFromHex:(NSString *)hexString alpha:(CGFloat)alpha{
    unsigned int hexInt = 0;
    // Create scanner
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    // Tell scanner to skip the # character
    [scanner setCharactersToBeSkipped:[NSCharacterSet characterSetWithCharactersInString:@"#"]];
    // Scan hex value
    [scanner scanHexInt:&hexInt];
    
    // Create color object, specifying alpha as well
    UIColor *color =
    [UIColor colorWithRed:((CGFloat) ((hexInt & 0xFF0000) >> 16))/255
                    green:((CGFloat) ((hexInt & 0xFF00) >> 8))/255
                     blue:((CGFloat) (hexInt & 0xFF))/255
                    alpha:alpha > 1.0 ? 1.0 : alpha];
    
    return color;
}

+ (NSString *)safeStringMethod:(NSString *)str {
    if (str.length == 0) {
        return @"暂无";
    } else {
        return str;
    }
}

@end

@implementation YHVertorlBtn


-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self=[super initWithFrame:frame]) {
        
        self.titleLabel.textAlignment=NSTextAlignmentCenter;
        
    }
    
    
    
    return self;
}


-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    self.imageView.xmg_x=(self.xmg_width-self.imageView.xmg_width)*0.5;
    self.imageView.xmg_y=0;
    
    self.imageView.xmg_width=self.imageView.xmg_width;
    
    self.imageView.xmg_height=self.imageView.xmg_height;
    
    self.titleLabel.xmg_x=0;
    
    self.titleLabel.xmg_y=self.imageView.xmg_height+5;
    
    self.titleLabel.xmg_width=self.xmg_width;
    
    self.titleLabel.xmg_height=self.xmg_height-self.titleLabel.xmg_y;
    
}

@end

//make cell
//- (instancetype)initWithFrame:(CGRect)frame {
//    if (self = [super initWithFrame:frame]) {
//        [self addViews];
//        [self layoutViews];
//        self.selectionStyle = UITableViewCellSelectionStyleNone;
//    }
//    return self;
//}
//- (void)addViews {
//    
//}
//- (void)layoutViews {
//    
//}
