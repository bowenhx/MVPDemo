//
//  BaseNetworkProtocol.h
//  MVPDemo
//
//  Created by ligb on 2017/7/24.
//  Copyright © 2017年 com.mobile-kingdom.ekapps. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BaseNetworkProtocol <NSObject>

+ (id<BaseNetworkProtocol>)startGETURL:(void(^)(NSArray *info, NSString *error))block;

@end
