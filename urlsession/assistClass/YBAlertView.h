//
//  YBAlertView.h
//  YBAlert
//
//  Created by YeYanghuan on 16/8/17.
//  Copyright © 2016年 wu bing. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,YBAlaerViewEvent){
    YBAlertViewEventYES = 0,
    YBAlertViewEventNO
};

@class YBAlertView;
@protocol YBAlertViewDelegate <NSObject>

- (void)alertView:(YBAlertView *)alertView handleEvent:(YBAlaerViewEvent)event;

@end

typedef void(^AlertViewBlock)(YBAlaerViewEvent event);

/**
 *  弹出层 带标题 带列表内容(可不带) 带提示内容 带确认按钮
 */

@interface YBAlertView : UIView

@property(nonatomic, assign) id <YBAlertViewDelegate> delegate;


/**
 *  采用网络请求时传入
 *  初始化 “我知道了”  弹窗 带蒙板
 *
 *  @param hint 可填nil，当为nil时，显示“正在加载...”
 *
 *  @return instancetype //需接收，success时使用successShowWithTitle， failure时使用failureWithErrorStr
 */
+ (instancetype)alertViewHUDWithHint:(NSString *)hint;
//  success 时使用，当前需求title填nil， tips填nil， lists传入格式为NSArray
- (void)successShowWithTitle:(NSString *)title lists:(NSArray *)lists tips:(NSString *)tips block:(AlertViewBlock)block;
//  failure 时使用，errorStr可不填，默认为“请求失败...”
- (void)failureWithErrorStr:(NSString *)errorStr;

/**
 *  不采用网络请求时，传入lists
 *  初始化确认弹窗 带蒙板
 *
 *  @param frame 弹窗frame 默认整个屏幕
 *  @param title 弹窗的标题 可为nil
 *  @param lists 列表内容  可为nil
 *  @param tips  提示内容  not nil
 *  @return 确认弹窗
 */
+ (instancetype)alertViewWithTitle:(NSString *)title lists:(NSArray *)lists tips:(NSString *)tips block:(AlertViewBlock)block;
- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title lists:(NSArray *)lists tips:(NSString *)tips;
/**
 *  弹窗出现
 *
 *  @param showTime 动画时间
 */
- (void)showWithTime:(CGFloat)showTime;
@end

@interface YBAlertCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *orderNumLabel;
@property (weak, nonatomic) IBOutlet UIView *midSegmentLine;
@property (weak, nonatomic) IBOutlet UILabel *goodsNameLabel;
@property (weak, nonatomic) IBOutlet UIView *topSegmentLine;
@property (weak, nonatomic) IBOutlet UIView *bottomSegmentLine;

+ (instancetype)alertCellWithNum:(NSString *)num GoodsName:(NSString *)name;

@end
