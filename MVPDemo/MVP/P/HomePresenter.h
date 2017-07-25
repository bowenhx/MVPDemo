//
//  HomePresenter.h
//  MVPDemo
//
//  Created by stray s on 2017/7/24.
//  Copyright © 2017年 com.mobile-kingdom.ekapps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BasePresenterProtocol.h"

@class BLoopImageView;

@interface HomePresenter : NSObject

@property (nonatomic, strong) BLoopImageView *headView;
@property (nonatomic, weak) id<BasePresenterProtocol> protocol;

- (void)loadData;

@end
