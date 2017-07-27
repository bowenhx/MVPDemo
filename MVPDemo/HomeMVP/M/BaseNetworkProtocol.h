//
//  BaseNetworkProtocol.h
//  MVPDemo
//
//  Created by ligb on 2017/7/24.
//  Copyright © 2017年 com.mobile-kingdom.ekapps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BKNetworking.h"

@protocol BaseNetworkProtocol <NSObject>

+ (void)startGETURL:(void(^)(BKNetworkModel *model, NSString *error))block;

@end
