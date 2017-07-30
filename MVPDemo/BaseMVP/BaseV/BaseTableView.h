//
//  BaseTableView.h
//  MVPDemo
//
//  Created by stray s on 2017/7/29.
//  Copyright © 2017年 com.mobile-kingdom.ekapps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTabViewProtocol.h"
#import "BaseTableViewPresenter.h"

@interface BaseTableView : UITableView <BaseTabViewProtocol>

//需要持有P 层对象的引用
@property (nonatomic, strong) BaseTableViewPresenter *presenter;

- (BaseTableView *(^)(NSArray *))datasource;

@property (nonatomic, strong) NSMutableArray * vDatasource;


@end
