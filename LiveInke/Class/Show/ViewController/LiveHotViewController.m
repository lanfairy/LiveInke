//
//  LiveHotViewController.m
//  LiveInke
//
//  Created by 张俊伟 on 2017/1/15.
//  Copyright © 2017年 lanfairy. All rights reserved.
//

#import "LiveHotViewController.h"
#import "LivePlayerViewController.h"
#import "LiveLiveHandler.h"
#import "LiveHotCell.h"
@interface LiveHotViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray *liveList;
@end

@implementation LiveHotViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
    [self loadData];
}

- (void)initUI {
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView.rowHeight = LIVEHOTCELLTOPH + ScreenWidth;
    self.view.top = 44.f;
    self.liveList = [NSMutableArray array];
}
- (void)loadData {
    [LiveLiveHandler executeGetHotLiveTaskWithSuccess:^(id obj) {
        NSLog(@"%@",obj);
        [self.liveList addObjectsFromArray:obj];
        [self.tableView reloadData];
    } Failed:^(id obj) {
        
    }];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.liveList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LiveHotCell *cell = [LiveHotCell LiveHotCellWithTableView:tableView];
    cell.liveTop = self.liveList[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    LivePlayerViewController *livePlayer = [[LivePlayerViewController alloc] init];
    livePlayer.liveTop = self.liveList[indexPath.row];
    [self presentViewController:livePlayer animated:YES completion:nil];
}
@end
