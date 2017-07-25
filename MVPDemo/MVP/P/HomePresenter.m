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
- (void)setProtocol:(id<BasePresenterProtocol>)protocol{
    _protocol = protocol;
}

- (void)loadData{
    [HomeListModel startGETURL:^(NSArray *info, NSString *error) {
        if (error) {
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
}
- (void)foucusImageFrame:(BLoopImageView *)imageView currentItem:(NSInteger)index{
    NSLog(@"index = %zd",index);
}

- (void)cancelHeadView{
    self.headView = nil;
}


@end
