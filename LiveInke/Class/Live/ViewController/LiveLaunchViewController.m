//
//  LiveLaunchViewController.m
//  LiveInke
//
//  Created by 张俊伟 on 2017/1/15.
//  Copyright © 2017年 lanfairy. All rights reserved.
//

#import "LiveLaunchViewController.h"

@interface LiveLaunchViewController ()
@property (nonatomic, strong) UIImageView *bgImageV;
@property (nonatomic, strong) UIButton *closeBtn;
@end

@implementation LiveLaunchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUpSubViews];
    [self setUpLayout];
}

- (void)setUpSubViews {
    [self.view addSubview:self.bgImageV];
    [self.view addSubview:self.closeBtn];
}

- (void)setUpLayout {
    WS(weakSelf)
    [self.bgImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(weakSelf.view);
    }];
    
    [self.closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0.f);
        make.right.offset(0.f);
    }];
}

#pragma mark - GETTER && SETTER
- (UIImageView *)bgImageV {
    if (!_bgImageV) {
        _bgImageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_zbfx"]];
    }
    return _bgImageV;
}

-(UIButton *)closeBtn {
    if (!_closeBtn) {
        _closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_closeBtn setImage:[UIImage imageNamed:@"launch_close"] forState:UIControlStateNormal];
        [_closeBtn addTarget:self action:@selector(clickClose) forControlEvents:UIControlEventTouchUpInside];
    }
    return _closeBtn;
}
- (void)clickClose {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
