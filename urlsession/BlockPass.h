//
//  BlockPass.h
//  urlsession
//
//  Created by apple on 2016/11/17.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BlockPass : NSObject

+ (void)loginWithParam:(NSDictionary *)params success:(void(^)(int i))success failure:(void(^)(int j))failure;

@end
