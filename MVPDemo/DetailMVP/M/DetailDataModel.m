//
//  DetailDataModel.m
//  MVPDemo
//
//  Created by ligb on 2017/7/28.
//  Copyright © 2017年 com.mobile-kingdom.ekapps. All rights reserved.
//

#import "DetailDataModel.h"

@implementation DetailDataModel


+ (void)loadDetailDataModel:(CompletionBlock)block{
   
    
    [self startGET:@"http://bapi.baby-kingdom.com/index.php?mod=stand&op=list&ver=2.0.0&app=ios" response:^(BKNetworkModel *model, NSString *netErr) {
    
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

            block (model, netErr);
        
//        });
        
    }];
    
}

+ (NSArray <DetailListModel *> *)listdata:(NSDictionary *)info{
    NSArray *lists = info[@"lists"];
    NSMutableArray *items = [NSMutableArray arrayWithCapacity:lists.count];
    [lists enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        DetailListModel *listData = [DetailListModel new];
        [listData setValuesForKeysWithDictionary:obj];
        [items addObject:listData];
    }];
    
    return items;
}

@end
