//
//  BLoopImageItem.h
//  BKMobile
//
//  Created by Guibin on 15/1/13.
//  Copyright (c) 2015年 com.mobile-kingdom.bkapps All rights reserved.
//
/**
 单纯的model 数据模型
 */
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "BKNetworkModel.h"
@interface BLoopImageItem : BKNetworkModel

@property (nonatomic, copy)     NSString      *title;
@property (nonatomic, strong)   NSString      *imgurl;
@property (nonatomic, strong)   NSString      *skipurl;
@property (nonatomic, assign)   NSInteger     residencetime;
@property (nonatomic, assign)   NSInteger     tid;
@property (nonatomic, assign)   NSInteger     tag;
@property (nonatomic, strong)   UIImageView   *imgView;



- (id)initWithDict:(NSDictionary *)dict tag:(NSInteger)tag;

@end
