//
//  BaseViewProtocol.h
//  MVPDemo
//
//  Created by ligb on 2017/7/25.
//  Copyright © 2017年 com.mobile-kingdom.ekapps. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BaseViewProtocol <NSObject>

- (void)showRemindTitle:(NSString *)message;

@optional
- (void)testTouchAction:(NSInteger)index;
@end
