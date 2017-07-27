//
//  DetailTableViewPresenter.h
//  MVPDemo
//
//  Created by stray s on 2017/7/27.
//  Copyright © 2017年 com.mobile-kingdom.ekapps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//使用P层分解tableView，定义一个实现tableView 的代理
@interface DetailTableViewPresenter : NSObject<UITableViewDelegate,UITableViewDataSource>

//如果V 层需要传入数据过来，需要在方法后面追加参数，这里是测试，就不传了
- (void)loadData;

@end
