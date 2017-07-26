//
//  HomePresenter.m
//  MVPDemo
//
//  Created by stray s on 2017/7/24.
//  Copyright © 2017年 com.mobile-kingdom.ekapps. All rights reserved.
//

#import "HomePresenter.h"
#import "HomeListModel.h"
#import "BLoopImageView.h"

#define Screen_bounds  [UIScreen mainScreen].bounds

@interface HomePresenter ()<BLoopImageViewDelegate>

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

- (BLoopImageView *)headView{
    if (!_headView) {
        _headView = [[BLoopImageView alloc] initWithFrame:CGRectMake(0, 0, Screen_bounds.size.width, 240) delegate:self imageItems:nil isAuto:YES];
    }
    return _headView;
}

- (void)setProtocol:(id<BaseViewProtocol>)protocol{
    _protocol = protocol;
}

- (void)loadData{
    [HomeListModel startGETURL:^(NSArray *info, NSString *error) {
        if (error) {
            //当请求出错时需要回调给出提示信息
            if (self.protocol) {
                [self.protocol showRemindTitle:error];
            }
        } else {
            [self.headView setItemsArr:info];
        }
    }];
}

#pragma mark
- (void)foucusImageFrame:(BLoopImageView *)imageView didSelectItem:(BLoopImageItem *)item{
    NSLog(@"item.title = %@",item.title);
    [self.protocol testTouchAction:item.tag];
    
}
- (void)foucusImageFrame:(BLoopImageView *)imageView currentItem:(NSInteger)index{
    NSLog(@"index = %zd",index);
}

- (void)cancelHeadView{
    self.headView = nil;
}


@end
