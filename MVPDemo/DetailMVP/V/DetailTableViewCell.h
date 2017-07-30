//
//  DetailTableViewCell.h
//  MVPDemo
//
//  Created by stray s on 2017/7/29.
//  Copyright © 2017年 com.mobile-kingdom.ekapps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailListModel.h"
@interface DetailTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *vTime;

@property (weak, nonatomic) IBOutlet UILabel *vTitleLab;

- (void)setModelData:(DetailListModel *)data;
@end
