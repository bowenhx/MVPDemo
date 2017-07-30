//
//  DetailListModel.h
//  MVPDemo
//
//  Created by stray s on 2017/7/29.
//  Copyright © 2017年 com.mobile-kingdom.ekapps. All rights reserved.
//

#import "BKNetworkModel.h"

@interface DetailListModel : BKNetworkModel

@property (nonatomic, copy) NSString *class_name;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *add_time;
/**
 "class_name": "王國消息",
 "add_time": "1500547279",
 "addtime": "Thu Jul 20 GMT 2017",
 "title": "［立即參加］校長教你如何助學童 愉快有效學習",
 */


@end
