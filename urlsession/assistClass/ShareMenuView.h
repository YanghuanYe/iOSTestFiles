//
//  ShareMenuView.h
//  urlsession
//
//  Created by apple on 2016/11/21.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ shareButtonClickBlock)(NSInteger index);

@interface ShareMenuView : UIView
{
    UIButton *_backView;
}

- (void)show;
- (void)hide;

@property(nonatomic,copy)shareButtonClickBlock block;

@end
