//
//  DetailViewController.m
//  MVPDemo
//
//  Created by ligb on 2017/7/24.
//  Copyright © 2017年 com.mobile-kingdom.ekapps. All rights reserved.
//

#import "DetailViewController.h"
#import "DetailTableViewPresenter.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) DetailTableViewPresenter *presenter;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self.presenter;
    self.tableView.dataSource = self.presenter;
    
//    [self.presenter loadData];
    [self.tableView reloadData];
    
}

- (DetailTableViewPresenter *)presenter{
    if (!_presenter) {
        _presenter = [DetailTableViewPresenter new];
    }
    return _presenter;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
