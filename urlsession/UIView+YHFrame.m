//
//  UIView+YHFrame.m
//  urlsession
//
//  Created by apple on 2016/11/30.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "UIView+YHFrame.h"

@implementation UIView (YHFrame)

//+(instancetype)viewWithHexColor:(NSString *)hexString{
//    
//    UIView *view = [[UIView alloc] init];
//    
//    view.backgroundColor = [UIColor colorFromHex:hexString];
//    
//    return view;
//}
+ (instancetype)xmg_viewFromXib
{
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil].firstObject;
}

- (void)setXmg_height:(CGFloat)xmg_height
{
    CGRect rect = self.frame;
    rect.size.height = xmg_height;
    self.frame = rect;
}

- (CGFloat)xmg_height
{
    return self.frame.size.height;
}

- (CGFloat)xmg_width
{
    return self.frame.size.width;
}
- (void)setXmg_width:(CGFloat)xmg_width
{
    CGRect rect = self.frame;
    rect.size.width = xmg_width;
    self.frame = rect;
}

- (CGFloat)xmg_x
{
    return self.frame.origin.x;
    
}

- (void)setXmg_x:(CGFloat)xmg_x
{
    CGRect rect = self.frame;
    rect.origin.x = xmg_x;
    self.frame = rect;
}

- (void)setXmg_y:(CGFloat)xmg_y
{
    CGRect rect = self.frame;
    rect.origin.y = xmg_y;
    self.frame = rect;
}

- (CGFloat)xmg_y
{
    
    return self.frame.origin.y;
}

- (void)setXmg_centerX:(CGFloat)xmg_centerX
{
    CGPoint center = self.center;
    center.x = xmg_centerX;
    self.center = center;
}

- (CGFloat)xmg_centerX
{
    return self.center.x;
}

- (void)setXmg_centerY:(CGFloat)xmg_centerY
{
    CGPoint center = self.center;
    center.y = xmg_centerY;
    self.center = center;
}

- (CGFloat)xmg_centerY
{
    return self.center.y;
}

-(BOOL)xl_isShowInKeyWindow{
    
    UIWindow *keywindow=[UIApplication sharedApplication].keyWindow;
    
    CGRect newFrame=[keywindow convertRect:self.frame fromView:self.superview];
    
    CGRect windowb=keywindow.bounds;
    
    BOOL inster=CGRectIntersectsRect(newFrame, windowb);
    
    return !self.isHidden && self.alpha>0.01 && self.window==keywindow && inster;
}

@end
