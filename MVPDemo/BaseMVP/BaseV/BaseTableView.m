//
//  BaseTableView.m
//  MVPDemo
//
//  Created by stray s on 2017/7/29.
//  Copyright © 2017年 com.mobile-kingdom.ekapps. All rights reserved.
//

#import "BaseTableView.h"

@interface BaseTableView ()

@end

@implementation BaseTableView

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}


- (BaseTableView *(^)(NSArray *))datasource{
    return ^(NSArray *data){
        [self.vDatasource setArray:data];
        self.presenter.numberOfRow(data.count);
        [self reloadData];
        return self;
    };
}


- (NSMutableArray *)vDatasource{
    if (!_vDatasource) {
        _vDatasource = [NSMutableArray array];
    }
    return _vDatasource;
}


//- (void)setPresenter:(BaseTableViewPresenter *)presenter{
//    
//}
@end
