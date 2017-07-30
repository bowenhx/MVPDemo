//
//  TableViewController.m
//  MVPDemo
//
//  Created by ligb on 2017/7/24.
//  Copyright © 2017年 com.mobile-kingdom.ekapps. All rights reserved.
//

#import "TableViewController.h"
#import "BLoopImageView.h"
#import "HomePresenter.h"

#import "BLoopImageView.h"
#import "HomeViewProtocol.h"
#import "DetailViewController.h"


@interface TableViewController ()<HomeViewProtocol,BLoopImageViewDelegate>

//V 层包括UIView 和UIViewController及子类，需要持有P 层的实例对象
@property (nonatomic, strong) HomePresenter *presenter;

@property (nonatomic, strong) BLoopImageView *headView;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化一个P对象
    _presenter = [[HomePresenter alloc] init];
    
    //使用协议绑定进行数据传输
    _presenter.protocol = self;
    
    //显示head view，这里在P层创建了headView，当然也可以在Controller里面创建，传入P层
    self.tableView.tableHeaderView = self.headView;
    self.tableView.delegate = _presenter;
    self.tableView.dataSource = _presenter;

    
    _presenter.numberOfSection(1).numberOfRow(2).heightForHead(40);
    
    //请求表头head view 数据
    [_presenter loadData];
    
}

- (BLoopImageView *)headView{
    if (!_headView) {
        _headView = [[BLoopImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 240) delegate:self imageItems:nil isAuto:YES];
    }
    return _headView;
}


- (void)updataData:(NSArray<BLoopImageItem *> *)info error:(NSString *)error{
    if (error) {
        //show view
        [[[UIAlertView alloc] initWithTitle:@"温馨提示" message:error delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil] show];
    } else {
        self.headView.itemsArr = info;
    }
}




- (void)testTouchAction:(NSInteger)index{
    DetailViewController *viewC = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    [self.navigationController pushViewController:viewC animated:YES];
}

#pragma mark
- (void)foucusImageFrame:(BLoopImageView *)imageView didSelectItem:(BLoopImageItem *)item{
    NSLog(@"item.title = %@",item.title);
    [self testTouchAction:item.tag];
}
- (void)foucusImageFrame:(BLoopImageView *)imageView currentItem:(NSInteger)index{
    NSLog(@"index = %zd",index);
}


#pragma mark - Table view data source


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tabCell" forIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"cell_row_%zd",indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"select at index = %zd",indexPath.row);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
