//
//  BaseViewProtocol.h
//  MVPDemo
//
//  Created by ligb on 2017/7/25.
//  Copyright © 2017年 com.mobile-kingdom.ekapps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BLoopImageItem.h"

@protocol BaseViewProtocol <NSObject>

- (void)showRemindData:(NSArray <BLoopImageItem *> *)imgsModel Title:(NSString *)message;

@end
