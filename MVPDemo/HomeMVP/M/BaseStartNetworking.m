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

+ (void)start:(NSString *)urlString parameters:(NSDictionary *)parameters response:(CompletionBlock)block{
    if (parameters) {
        [self startPOST:urlString parameters:parameters response:block];
    } else {
        [self startGET:urlString response:block];
    }
}


+ (void)startGET:(NSString *)urlString response:(CompletionBlock)block{
    [[BKNetworking share] get:urlString completion:^(BKNetworkModel *model, NSString *netErr) {
        if (netErr) {
            block(nil, netErr);
        } else {
            block(model, nil);
        }
    }];
}

+ (void)startPOST:(NSString *)urlSring parameters:(NSDictionary *)parameters response:(CompletionBlock)block{
    [[BKNetworking share] post:urlSring params:parameters completion:^(BKNetworkModel *model, NSString *netErr) {
        if (netErr) {
            block(nil, netErr);
        } else {
            block(model, nil);
        }
    }];
}



@end
