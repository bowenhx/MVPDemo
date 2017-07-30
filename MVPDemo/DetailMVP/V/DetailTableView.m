//
//  DetailTableView.m
//  MVPDemo
//
//  Created by stray s on 2017/7/29.
//  Copyright © 2017年 com.mobile-kingdom.ekapps. All rights reserved.
//

#import "DetailTableView.h"
#import "DetailTableViewCell.h"
#import "DetailTableViewPresenter.h"

@implementation DetailTableView

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tabCell" forIndexPath:indexPath];
    
    [cell setModelData:self.vDatasource[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"detail cell index = %zd",indexPath.row);
}

//- (BaseTableView *(^)(NSArray *))datasource{
//    return ^(NSArray *data){
//        [self.vDatasource setArray:data];
//        self.presenter.numberOfRow(data.count);
//        return self;
//    };
//}

//- (void)setPresenter:(DetailTableViewPresenter *)presenter{
//    self.presenter = presenter;
//}

//- (void)setPresenter:(BaseTableViewPresenter *)presenter{
//    presenter = (DetailTableViewPresenter *) presenter;
//}

@end
