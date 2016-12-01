//
//  YHViewsMaker.m
//  urlsession
//
//  Created by yeyanghuan on 2016/11/30.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "YHViewsMaker.h"
#import "UIView+YHFrame.h"

@implementation YHViewsMaker

+ (UILabel *)makeLabelWithFontSie:(NSInteger)fontSize textColor:(UIColor *)color name:(NSString *)labelName labelTextAlignment:(labelTextAlignment)textAlign {
    UILabel *label = [[UILabel alloc] init];
    if (fontSize != 0) {
        label.font = [UIFont systemFontOfSize:fontSize];
    }
    if (color != nil) {
        label.textColor = color;
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
+(UIButton *)makeButtonWithFontSie:(NSInteger)fontSize titleColor:(UIColor *)color selectedColor:(UIColor *)selectedColor highlightedColor:(UIColor *)highlightedColor name:(NSString *)btnName imageName:(NSString *)imgName selectedImageName:(NSString *)selectedImageName tag:(NSInteger)tag {
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
        [btn setTitleColor:color forState:UIControlStateNormal];
    } else {
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    if (selectedColor != nil) {
        [btn setTitleColor:selectedColor forState:UIControlStateSelected];
    }
    if (highlightedColor != nil) {
        [btn setTitleColor:highlightedColor forState:UIControlStateHighlighted];
    }
    if (selectedImageName != nil) {
        [btn setImage:[UIImage imageNamed:selectedImageName] forState:UIControlStateNormal];
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
