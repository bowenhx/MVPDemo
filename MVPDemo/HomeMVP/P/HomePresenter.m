//
//  HomePresenter.m
//  MVPDemo
//
//  Created by stray s on 2017/7/24.
//  Copyright © 2017年 com.mobile-kingdom.ekapps. All rights reserved.
//

#import "HomePresenter.h"
#import "HomeListModel.h"
#import "HomeViewProtocol.h"

@interface HomePresenter ()


@end

/**
 *  P 层作为协调者（中介），需要持有M 层和V 层的对象的引用
 *  适当的时候去协调他们的更新逻辑
 */
@implementation HomePresenter

- (instancetype)init{
    if (self = [super init]) {
        
    }
    return self;
}


- (void)loadData{
    [HomeListModel startHomeList:^(BKNetworkModel *model, NSString *netErr) {
        
        
        if (netErr) {
            
            //当请求出错时需要回调给出提示信息
            if (self.protocol) {
                 [(id<HomeViewProtocol>)self.protocol updataData:nil error:netErr];
//                [(id<HomeViewProtocol>)self.protocol showRemindData:nil Title:netErr];
            }
        } else {
            if (model.status) {
                NSDictionary *data = model.data;
                if ([data isKindOfClass:[NSDictionary class]]) {
                    NSArray <BLoopImageItem *> *items = [HomeListModel loadPackageData:data[@"lists"]];
                    
                    if (self.protocol) {
                        [(id<HomeViewProtocol>)self.protocol updataData:items error:nil];

//                        [(id<HomeViewProtocol>)self.protocol showRemindData:items Title:nil];
                    }
                }
            }
        }
    }];
    
    
}




@end
