//
//  LiveBaseNavController.m
//  LiveInke
//
//  Created by 张俊伟 on 2017/1/15.
//  Copyright © 2017年 lanfairy. All rights reserved.
//

#import "LiveBaseNavController.h"

@interface LiveBaseNavController ()

@end

@implementation LiveBaseNavController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationBar.barTintColor = [UIColor colorWithRed:0.00f green:0.85f blue:0.79f alpha:1.00f];
    self.navigationBar.tintColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
