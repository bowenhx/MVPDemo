//
//  DetailViewController.m
//  MVPDemo
//
//  Created by ligb on 2017/7/24.
//  Copyright © 2017年 com.mobile-kingdom.ekapps. All rights reserved.
//

#import "DetailViewController.h"
#import "DetailTableView.h"
#import "DetailTableViewPresenter.h"
#import "DetailTableViewCell.h"
#import "DetailListModel.h"
#import "MBProgressHUD+Add.h"
#import "BaseViewUpdataProtocol.h"

@interface DetailViewController ()<BaseViewUpdataProtocol>

@property (weak, nonatomic) IBOutlet DetailTableView *tableView;

@property (nonatomic, strong) DetailTableViewPresenter *presenter;

//@property (nonatomic, strong) NSMutableArray <DetailListModel *>*datasource;
@end

@implementation DetailViewController

- (void)dealloc{
    NSLog(@"----- %s --------",__func__);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.tableView registerNib:[UINib nibWithNibName:@"DetailTableViewCell" bundle:nil] forCellReuseIdentifier:@"tabCell"];
    
    self.tableView.delegate = self.presenter;
    self.tableView.dataSource = self.presenter;
   
    self.tableView.presenter = self.presenter;
    
    //数据回调协议
    self.presenter.protocol = self;
    
    
    [self.presenter loadData];
}

- (DetailTableViewPresenter *)presenter{
    if (!_presenter) {
        _presenter = [DetailTableViewPresenter new];
    }
    return _presenter;
}


- (void)updataData:(NSArray *)info error:(NSString *)error{
    if (error) {
        //弹出信息提示view
        [self.view showHUDTitleView:error image:nil];
    } else {
//        [self.datasource setArray:info];
//        self.presenter.numberOfRow(self.datasource.count);
//        [self.tableView reloadData];
        
        self.tableView.datasource(info);
    }
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tabCell" forIndexPath:indexPath];
    
    cell.textLabel.text = @"test";
//    [cell setModelData:self.datasource[indexPath.row]];
    return cell;
}
//
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"detail cell index = %zd",indexPath.row);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (NSMutableArray <DetailListModel *>*)datasource{
//    if (!_datasource) {
//        _datasource = [NSMutableArray array];
//    }
//    return _datasource;
//}
@end
