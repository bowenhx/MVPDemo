//
//  BaseTableViewPresenter.h
//  MVPDemo
//
//  Created by stray s on 2017/7/29.
//  Copyright © 2017年 com.mobile-kingdom.ekapps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "BaseViewProtocol.h"

//使用P层分解tableView的Delegate和DataSource
//子类通过链式编程给具体的数据
//通过BaseTabViewProtocol 协议去和View 交互

@interface BaseTableViewPresenter : NSObject <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, weak) id<BaseViewProtocol> protocol;


//使用构建者模式来去实现tableViewDataSource
//链式指定Section
- (BaseTableViewPresenter *(^)(NSInteger number))numberOfSection;

//链式指定Row
- (BaseTableViewPresenter *(^)(NSInteger number))numberOfRow;

//链式指定cell head height
- (BaseTableViewPresenter *(^)(CGFloat height))heightForHead;

//链式指定cell height
- (BaseTableViewPresenter *(^)(CGFloat height))heightForRow;

//如果P 层中以实例对象去做延时操作，这里需要给协议置nil
//默认是类方法处理延时操作（如网络请求），不会持有对象
- (void)cancelProtocol;


@end
