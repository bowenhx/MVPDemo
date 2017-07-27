//
//  HomePresenter.h
//  MVPDemo
//
//  Created by stray s on 2017/7/24.
//  Copyright © 2017年 com.mobile-kingdom.ekapps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseViewProtocol.h"


@interface HomePresenter : NSObject

//制定一个协议，例如数据更新时当有数据需要回调，或者点击view 事件回调
@property (nonatomic, weak) id<BaseViewProtocol> protocol;

- (void)loadData;

@end
