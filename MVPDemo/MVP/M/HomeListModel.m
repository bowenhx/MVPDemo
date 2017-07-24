//
//  HomeListModel.m
//  MVPDemo
//
//  Created by ligb on 2017/7/24.
//  Copyright © 2017年 com.mobile-kingdom.ekapps. All rights reserved.
//

#import "HomeListModel.h"
#import "BKNetworking.h"
#import "BLoopImageItem.h"

@implementation HomeListModel

+ (id<BaseNetworkProtocol>)startGETURL:(void (^)(NSArray *info, NSString *error))block{
    HomeListModel *list = [[HomeListModel alloc] init];
    [[BKNetworking share] get:@"http://bapi.baby-kingdom.com/index.php?mod=stand&op=index&ver=3.0.0&app=android" completion:^(BKNetworkModel *model, NSString *netErr) {
        if (netErr) {
            block(nil, netErr);
        } else {
            if (model.status) {
                NSDictionary *data = model.data;
                if ([data isKindOfClass:[NSDictionary class]]) {
                    //创建model
                    block (data[@"list"] , nil);
                }
            }
        }
    }];
    return list;
}

@end
