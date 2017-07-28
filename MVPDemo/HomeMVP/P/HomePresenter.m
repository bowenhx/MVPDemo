//
//  HomePresenter.m
//  MVPDemo
//
//  Created by stray s on 2017/7/24.
//  Copyright © 2017年 com.mobile-kingdom.ekapps. All rights reserved.
//

#import "HomePresenter.h"
#import "HomeListModel.h"

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

- (void)setProtocol:(id<BaseViewProtocol>)protocol{
    _protocol = protocol;
}

- (void)loadData{
    [HomeListModel startHomeList:^(BKNetworkModel *model, NSString *netErr) {
        if (netErr) {
            //当请求出错时需要回调给出提示信息
            if (self.protocol) {
                [self.protocol showRemindData:nil Title:netErr];
            }
        } else {
            if (model.status) {
                NSDictionary *data = model.data;
                if ([data isKindOfClass:[NSDictionary class]]) {
                    NSArray *items = [HomeListModel loadPackageData:data[@"lists"]];
                    
                    if (self.protocol) {
                        [self.protocol showRemindData:items Title:nil];
                    }
                }
            }
        }
    }];
    
    
}



- (void)cancelViewProtocol{
    self.protocol = nil;
}


@end
