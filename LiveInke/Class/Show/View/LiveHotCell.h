//
//  LiveHotCell.h
//  LiveInke
//
//  Created by 张俊伟 on 2017/1/21.
//  Copyright © 2017年 lanfairy. All rights reserved.
//

#import <UIKit/UIKit.h>
#define LIVEHOTCELLTOPH 70.f

@class LiveTop;
@interface LiveHotCell : UITableViewCell
@property (nonatomic, strong) LiveTop *liveTop;

+(instancetype)LiveHotCellWithTableView:(UITableView*)tableView;
@end
