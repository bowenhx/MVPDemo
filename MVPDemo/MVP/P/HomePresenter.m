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

@interface HomePresenter ()

@property (nonatomic, strong) HomeListModel *listModel;
@property (nonatomic, strong) BLoopImageView *headView;
@end


@implementation HomePresenter


- (instancetype)init{
    if (self = [super init]) {
        self.listModel = [HomeListModel startGETURL:^(NSArray *info, NSString *error) {
            
        }];

    }
    return self;
}

- (void)setHeadView:(BLoopImageView *)imageView{
    self.headView = imageView;
}

- (void)cancelHeadView{
    self.headView = nil;
}


@end
