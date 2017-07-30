//
//  BaseViewUpdataProtocol.h
//  MVPDemo
//
//  Created by stray s on 2017/7/30.
//  Copyright © 2017年 com.mobile-kingdom.ekapps. All rights reserved.
//

#import "BaseTabViewProtocol.h"

@protocol BaseViewUpdataProtocol <BaseTabViewProtocol>

- (void)updataData:(NSArray <BKNetworkModel *> *)info error:(NSString *)error;

@end
