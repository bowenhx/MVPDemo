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

+ (void)startGETURL:(void (^)(NSArray *info, NSString *error))block{
    [[BKNetworking share] get:@"http://bapi.baby-kingdom.com/index.php?mod=stand&op=index&ver=3.6.0&app=ios" completion:^(BKNetworkModel *model, NSString *netErr) {
        if (netErr) {
            block(nil, netErr);
        } else {
            if (model.status) {
                NSDictionary *data = model.data;
                if ([data isKindOfClass:[NSDictionary class]]) {
                    NSArray *items = [self loadPackageData:data[@"lists"]];
                    
                    //创建model
                    block ( items, nil );
                }
            }
        }
    }];
}


//组装数据并返回
+ (NSArray *)loadPackageData:(NSArray *)images{
    //添加最后一张图 用于循环
    int length = (unsigned)images.count;
    NSMutableArray *itemArray = [NSMutableArray arrayWithCapacity:length+2];
    if (length > 1)
    {
        NSDictionary *dict = images[length-1];
        BLoopImageItem *item = [[BLoopImageItem alloc] initWithDict:dict tag:-1];
        [itemArray addObject:item];
    }
    for (int i = 0; i < length; i++)
    {
        NSDictionary *dict = images[i];
        BLoopImageItem *item = [[BLoopImageItem alloc] initWithDict:dict tag:i];
        [itemArray addObject:item];
    }
    //添加第一张图 用于循环
    if (length >1)
    {
        NSDictionary *dict = images[0];
        BLoopImageItem *item = [[BLoopImageItem alloc] initWithDict:dict tag:length];
        [itemArray addObject:item];
    }
    
    return itemArray;
    
}

@end
