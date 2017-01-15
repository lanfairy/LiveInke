//
//  LiveTabBarViewController.m
//  LiveInke
//
//  Created by 张俊伟 on 2017/1/15.
//  Copyright © 2017年 lanfairy. All rights reserved.
//

#import "LiveTabBarViewController.h"
#import "LiveBaseNavController.h"
#import "LiveLaunchViewController.h"
#import "LiveTabBar.h"
@interface LiveTabBarViewController ()<LiveTabBarDelegate>
@property (nonatomic, strong) LiveTabBar *liveTabbar;
@end

@implementation LiveTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   self.view.backgroundColor = [UIColor whiteColor];
    [self configViewControlers];
    
    [self.tabBar addSubview:self.liveTabbar];
    //删除tabbar 的阴影线
    [[UITabBar appearance] setShadowImage:[UIImage new]];
    [[UITabBar appearance] setBackgroundImage:[UIImage new]];
}

- (void)configViewControlers {
    NSMutableArray *array = [NSMutableArray arrayWithArray:@[@"LiveMainViewController",@"LiveMeViewController"]];
    for (NSInteger i = 0; i < array.count; i++) {
        
        UIViewController *vc = [[NSClassFromString(array[i]) alloc] init];
        LiveBaseNavController *nav = [[LiveBaseNavController alloc] initWithRootViewController:vc];
        [array replaceObjectAtIndex:i withObject:nav];
    }
    self.viewControllers = array;
}


#pragma mark - GETTER && SETTER
-(LiveTabBar *)liveTabbar {
    if (!_liveTabbar) {
        _liveTabbar = [[LiveTabBar alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 49.f)];
        _liveTabbar.delegate = self;
    }
    return _liveTabbar;
}
#pragma mark - LiveTabBarDelegate
- (void)tabBar:(LiveTabBar *)tabBar clickButton:(LiveItemType)index {
    if (index!=LiveItemTypeLaunch) {
        self.selectedIndex = index-LiveItemTypeLive;
        return;
    }
    
    LiveLaunchViewController *launchVc = [[LiveLaunchViewController alloc] init];
    [self presentViewController:launchVc animated:YES completion:nil];
    
}
@end
