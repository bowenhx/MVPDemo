//
//  BLoopImageItem.m
//  BKMobile
//
//  Created by Guibin on 15/1/13.
//  Copyright (c) 2015年 com.mobile-kingdom.bkapps All rights reserved.
//

#import "BLoopImageItem.h"


@implementation BLoopImageItem


- (id)initWithDict:(NSDictionary *)dict tag:(NSInteger)tag
{
    self = [super init];
    if (self)
    {
        if ([dict isKindOfClass:[NSDictionary class]])
        {
            self.title   = dict[@"title"];
            self.imgurl   = dict[@"imgurl"];
            self.skipurl = dict[@"skipurl"];
            self.residencetime = [dict[@"residencetime"] integerValue];
            if ([dict[@"type"] integerValue] == 0) {
                self.tid = [dict[@"tid"] integerValue];
            }else
                self.tid = -1;
            //..
        }
    }
    return self;
}

@end
