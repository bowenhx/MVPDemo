//
//  DetailDataModel.h
//  MVPDemo
//
//  Created by ligb on 2017/7/28.
//  Copyright © 2017年 com.mobile-kingdom.ekapps. All rights reserved.
//

#import "BaseStartNetworking.h"
#import "DetailListModel.h"

@interface DetailDataModel : BaseStartNetworking

+ (void)loadDetailDataModel:(CompletionBlock)block;

+ (NSArray <DetailListModel *> *)listdata:(NSDictionary *)info;

@end
