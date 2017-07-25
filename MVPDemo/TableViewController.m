//
//  TableViewController.m
//  MVPDemo
//
//  Created by ligb on 2017/7/24.
//  Copyright © 2017年 com.mobile-kingdom.ekapps. All rights reserved.
//

#import "TableViewController.h"
#import "HomePresenter.h"
#import "BLoopImageView.h"
#import "BaseViewProtocol.h"



@interface TableViewController ()<BaseViewProtocol>

//V 层需要持有P 层的对象
@property (nonatomic, strong) HomePresenter *presenter;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化一个P对象
    _presenter = [[HomePresenter alloc] init];
    
    //使用协议绑定进行数据传输
    _presenter.protocol = self;
    
    //显示head view
    self.tableView.tableHeaderView = _presenter.headView;
    
    
    [_presenter loadData];
    
    
 
}



- (void)showRemindTitle:(NSString *)message{
    if (message) {
        //show view
        [[[UIAlertView alloc] initWithTitle:@"温馨提示" message:message delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil] show];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 15;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tabCell" forIndexPath:indexPath];
    
   
    cell.textLabel.text = [NSString stringWithFormat:@"cell_row_%zd",indexPath.row];
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
