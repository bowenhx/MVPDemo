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

+ (void)start:(NSString *)urlString parameters:(NSDictionary *)parameters response:(CompletionBlock)block;

@optional
+ (void)startGET:(NSString *)urlString response:(CompletionBlock)block;

+ (void)startPOST:(NSString *)urlSring parameters:(NSDictionary *)parameters response:(CompletionBlock)block;

@end
