//
//  YHViewsMaker.m
//  urlsession
//
//  Created by apple on 2016/11/30.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "YHViewsMaker.h"

@implementation YHViewsMaker

+ (UIButton *)makeBtnWithFontSie:(NSInteger)fontSize titleColor:(UIColor *)color selectedColor:(UIColor *)selectedColor name:(NSString *)btnName imageName:(NSString *)imgName selectedImageName:(NSString *)selectedImageName tag:(NSInteger)tag {
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
    }
    if (selectedColor != nil) {
        [btn setTitleColor:selectedColor forState:UIControlStateSelected];
    }
    if (selectedImageName != nil) {
        [btn setImage:[UIImage imageNamed:selectedImageName] forState:UIControlStateNormal];
    }
    if (tag != 0) {
        btn.tag = tag;
    }
    return btn;
}

@end

#import "UIView+YHFrame.h"

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
