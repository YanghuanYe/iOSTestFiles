

//
//  BlockPass.m
//  urlsession
//
//  Created by apple on 2016/11/17.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "BlockPass.h"
#import <UIKit/UIKit.h>

@interface BlockPass()

@property (nonatomic, strong)UILabel *successLabel;
@property (nonatomic, strong)UILabel *failureLabel;

@end

@implementation BlockPass

+ (void)loginWithParam:(NSDictionary *)params success:(void (^)(int))success failure:(void (^)(int))failure {
    if (params.allKeys.count == 1) {
        success(10);
    } else {
        failure(5);
    }
}

@end
