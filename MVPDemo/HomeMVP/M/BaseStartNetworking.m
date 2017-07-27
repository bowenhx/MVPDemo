//
//  BaseStartNetworking.m
//  MVPDemo
//
//  Created by stray s on 2017/7/24.
//  Copyright © 2017年 com.mobile-kingdom.ekapps. All rights reserved.
//

#import "BaseStartNetworking.h"
#import "BKNetworking.h"

@implementation BaseStartNetworking

+ (void)startWithLoadData:(void (^)(NSArray *, NSString *))block{
    [[BKNetworking share] get:@"http://bapi.baby-kingdom.com/index.php?mod=stand&op=index&ver=3.0.0&app=android" completion:^(BKNetworkModel *model, NSString *netErr) {
        if (netErr) {
            block(nil, netErr);
        } else {
            if (model.status) {
                NSDictionary *data = model.data;
                if ([data isKindOfClass:[NSDictionary class]]) {
                    block (data[@"list"] , nil);
                }
            }
        }
    }];
}



@end
