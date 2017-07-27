//
//  HomeListModel.h
//  MVPDemo
//
//  Created by ligb on 2017/7/24.
//  Copyright © 2017年 com.mobile-kingdom.ekapps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseNetworkProtocol.h"
#import "BLoopImageItem.h"

@interface HomeListModel : NSObject<BaseNetworkProtocol>

//组装数据并返回
+ (NSArray <BLoopImageItem *>*)loadPackageData:(NSArray *)images;

@end
