//
//  LiveTabBar.h
//  LiveInke
//
//  Created by 张俊伟 on 2017/1/15.
//  Copyright © 2017年 lanfairy. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger, LiveItemType) {
    LiveItemTypeLaunch = 0x10,// 启动直播
    LiveItemTypeLive = 0x11, //展示直播
    LiveItemTypeMe           //我的
    
};
@class LiveTabBar;
typedef void(^LiveTabBarBlock)(LiveTabBar *tabBar, LiveItemType index);
@protocol LiveTabBarDelegate <NSObject>
- (void)tabBar:(LiveTabBar *)tabBar clickButton:(LiveItemType)index;
@end
@interface LiveTabBar : UIView
@property (nonatomic, weak) id <LiveTabBarDelegate> delegate;
@property (nonatomic, copy) LiveTabBarBlock liveTabbarBlock;
@end
