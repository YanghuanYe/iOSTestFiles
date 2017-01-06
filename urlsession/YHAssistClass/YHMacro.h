//
//  YHMacro.h
//  urlsession
//
//  Created by apple on 2016/12/26.
//  Copyright © 2016年 YYH. All rights reserved.
//

#ifndef YHMacro_h
#define YHMacro_h

#define kDEVICEWIDTH  [UIScreen mainScreen].bounds.size.width
#define kDEVICEHEIGHT  [UIScreen mainScreen].bounds.size.height
#define KSELFVIEWHEIGHT self.view.frame.size.height
#define KSELFVIEWWIDTH self.view.frame.size.width
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


#endif /* YHMacro_h */
