//
//  BaseTableViewPresenter.m
//  MVPDemo
//
//  Created by stray s on 2017/7/29.
//  Copyright © 2017年 com.mobile-kingdom.ekapps. All rights reserved.
//

#import "BaseTableViewPresenter.h"
#import "BaseTabViewProtocol.h"

@interface BaseTableViewPresenter ()
{
    NSInteger _vNumberSection;
    NSInteger _vNumberRow;
    NSInteger _vHeightRow;
    NSInteger _vHeightHead;
}

@end

@implementation BaseTableViewPresenter

- (instancetype)init{
    if (self = [super init]) {
        //初始化默认值
        _vNumberSection = 1;
        _vHeightRow = 44;
        
    }
    return self;
}

- (void)setProtocol:(id<BaseTabViewProtocol>)protocol{
    _protocol = protocol;
}

- (BaseTableViewPresenter *(^)(NSInteger))numberOfSection{
    return ^(NSInteger number){
        _vNumberSection = number;
        return self;
    };
}

- (BaseTableViewPresenter *(^)(NSInteger))numberOfRow{
    return ^(NSInteger number){
        _vNumberRow = number;
        return self;
    };
}

- (BaseTableViewPresenter *(^)(CGFloat))heightForHead{
    return ^(CGFloat height){
        _vHeightHead = height;
        return self;
    };
}


- (BaseTableViewPresenter *(^)(CGFloat))heightForRow{
    return ^(CGFloat height){
        _vHeightRow = height;
        return self;
    };
}

- (void)cancelProtocol{
    _protocol = nil;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _vNumberSection;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _vNumberRow;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_protocol) {
        return [(id<BaseTabViewProtocol>)_protocol tableView:tableView cellForRowAtIndexPath:indexPath];
    }
    return nil;
}


#pragma mark - Table view delegate
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return _vHeightHead;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return _vHeightRow;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (_protocol) {
        [(id<BaseTabViewProtocol>)_protocol tableView:tableView didSelectRowAtIndexPath:indexPath];
    }
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}

@end

