//
//  BaseTableViewProtocol.m
//  MVPDemo
//
//  Created by stray s on 2017/7/27.
//  Copyright © 2017年 com.mobile-kingdom.ekapps. All rights reserved.
//

#import "DetailTableViewPresenter.h"
#import "DetailDataModel.h"
#import "DetailTableViewCell.h"
#import "BaseViewUpdataProtocol.h"
#import "HomeListModel.h"
#import "BLoopImageItem.h"
@interface DetailTableViewPresenter ()



@end

@implementation DetailTableViewPresenter

- (instancetype)init{
    if (self = [super init]) {
       
    }
    return self;
}


- (void)loadData{
    //问Model 层获取数据
    [DetailDataModel loadDetailDataModel:^(BKNetworkModel *model, NSString *netErr) {
        if (!self.protocol)  return ;
        
        if (netErr) {
             [(id<BaseViewUpdataProtocol>)self.protocol updataData:nil error:netErr];
        } else {
            NSArray *arr = [DetailDataModel listdata:model.data];
            
            [(id<BaseViewUpdataProtocol>)self.protocol updataData:arr error:netErr];
        }
        
        
    }];
    
    
}

#pragma mark - Table view data source







@end
