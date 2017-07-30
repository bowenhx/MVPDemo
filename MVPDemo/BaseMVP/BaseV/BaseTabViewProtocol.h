//
//  BaseTabViewProtocol.h
//  MVPDemo
//
//  Created by stray s on 2017/7/29.
//  Copyright © 2017年 com.mobile-kingdom.ekapps. All rights reserved.
//

#import "BaseViewProtocol.h"
#import "BKNetworkModel.h"

//该协议为tableView 必须实现的协议
//这个协议只定义cell view 的展示细节，和点击事件
//子类具体页面可以扩展更多，后面可以做优化

@protocol BaseTabViewProtocol <BaseViewProtocol>

//更新UI
@optional
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;


//- (void)updataData:(NSArray <BKNetworkModel *> *)info error:(NSString *)error;

@end
