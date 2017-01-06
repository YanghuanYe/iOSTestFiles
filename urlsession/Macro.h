//
//  Macro.h
//  Transfar_EasyDispatch
//
//  Created by 曹帅 on 15/7/2.
//  Copyright (c) 2015年 Transfar. All rights reserved.
//

#ifndef Transfar_EasyDispatch_Macro_h
#define Transfar_EasyDispatch_Macro_h

#define kDEVICEWIDTH  [UIScreen mainScreen].bounds.size.width
#define kDEVICEHEIGHT  [UIScreen mainScreen].bounds.size.height
#define kScreen_Frame  (CGRectMake(0, 0 , kDEVICEWIDTH,kDEVICEHEIGHT))
#define kScreen_Frame  (CGRectMake(0, 0 , kDEVICEWIDTH,kDEVICEHEIGHT))
#define iPhone4  [UIScreen mainScreen].bounds.size.height == 480
#define iPhone5  [UIScreen mainScreen].bounds.size.height == 568
#define iPhone6  [UIScreen mainScreen].bounds.size.height == 667
#define iPhone6Plus  [UIScreen mainScreen].bounds.size.height == 736

//手机操作系统
#define iOS7Later ([UIDevice currentDevice].systemVersion.floatValue >= 7.0f)
#define iOS8Later ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f)
#define iOS9Later ([UIDevice currentDevice].systemVersion.floatValue >= 9.0f)
#define iOS9_1Later ([UIDevice currentDevice].systemVersion.floatValue >= 9.1f)
#define iOS10Later  ([UIDevice currentDevice].systemVersion.floatValue >= 10.0f)

//#define iOS7Later iOS(>= , 7.0)
//#define iOS8Later iOS(>= , 8.0)
//#define iOS7 (iOS7Later & !iOS8Later)
//#define iOS(sign ,index) ([UIDevice currentDevice].systemVersion.doubleValue sign index)

//UIImage相关常用方法
#define LoadImage(file) [UIImage imageWithContentsOfFile:[[[NSBundle mainBundle] resourcePath] stringByAppendingString:file]]

#define ImageNamed(_pointer) [UIImage imageNamed:_pointer]


#pragma mark - 路径和URL
//工程文件
#define BUNDLE_PATH(file,ext) [[NSBundle mainBundle]pathForResource:file ofType:ext]
//fileurl
#define FILEURL(file) (file?[[NSURL alloc] initFileURLWithPath:file]:nil)
//url
#define URL(file)   (file?[[NSURL alloc] initWithString:file]:nil)

//A better version of NSLog 重定义nslog  by cs
#define NSLog(format, ...) do {                                                                      \
fprintf(stderr, "<%s : %d> %s\n",                                           \
[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String],  \
__LINE__, __func__);                                                        \
(NSLog)((format), ##__VA_ARGS__);                                           \
fprintf(stderr, "-------\n");                                               \
} while (0)

// 常用颜色值
#define CHViewBackgroundColor @"#f2f2f2" // 用于背景色
#define CHContentColor @"#2f2f2f" // 用于内容/内容标题/输入内容/文本
#define CHSideContentColor @"#999999" // 用于次要内容/副标题/说明/提示文本
#define CHLineColor @"#d4d4d4" // 用于线框
#define CHTitleColor @"#ffffff" // 用于标题，深色背景

#define CHSpecialFieldColor @"#fa0000" // 用于特殊字段标亮(如金额)
#define CHMarkSelectedColor @"#ff6a0f" // 用于标签选中/状态文字
#define CHClickablelinkColor @"#0099ff" // 用于可点链接/订单状态
#define CHGreenColor @"#6cb62e" // 


//客户登录的partyid值
#define PARTYID [[NSUserDefaults standardUserDefaults] objectForKey:@"PartyId"]
//草稿箱的key
#define draftKey [NSString stringWithFormat:@"%@infodata",PARTYID]


//用户token

#define CHToken [[NSUserDefaults standardUserDefaults] objectForKey:@"token"]

#define YBXmppResourceID @"1031112"

#endif
