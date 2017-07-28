//
//  HomeListModel.h
//  MVPDemo
//
//  Created by ligb on 2017/7/24.
//  Copyright © 2017年 com.mobile-kingdom.ekapps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseStartNetworking.h"
#import "BLoopImageItem.h"

@interface HomeListModel :BaseStartNetworking

+ (void)startHomeList:(CompletionBlock)block;

//组装数据并返回
+ (NSArray <BLoopImageItem *>*)loadPackageData:(NSArray *)images;

@end
