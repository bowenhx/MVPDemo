//
//  BaseTableViewProtocol.m
//  MVPDemo
//
//  Created by stray s on 2017/7/27.
//  Copyright © 2017年 com.mobile-kingdom.ekapps. All rights reserved.
//

#import "DetailTableViewPresenter.h"

@implementation DetailTableViewPresenter


- (void)loadData{
    
    
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tabCell" forIndexPath:indexPath];
    
    
    cell.textLabel.text = [NSString stringWithFormat:@"cell_row_%zd",indexPath.row];
    return cell;
}

@end
