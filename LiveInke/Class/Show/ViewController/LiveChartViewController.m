//
//  LiveChartViewController.m
//  LiveInke
//
//  Created by 张俊伟 on 2017/1/21.
//  Copyright © 2017年 lanfairy. All rights reserved.
//

#import "LiveChartViewController.h"

@interface LiveChartViewController ()
@property (nonatomic, strong) UIButton *chatBtn;
@property (nonatomic, strong) UIButton *messageBtn;
@property (nonatomic, strong) UIButton *giftBtn;
@property (nonatomic, strong) UIButton *shareBtn;
@property (nonatomic, strong) UIView *bottomBaseView;
@end

@implementation LiveChartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor clearColor];
    self.view.alpha = 0.5f;
    // Do any additional setup after loading the view.
    [self initUI];
}

- (void)initUI {
    [self.view addSubview:self.bottomBaseView];
    [self.bottomBaseView addSubview:self.chatBtn];
    [self.bottomBaseView addSubview:self.messageBtn];
    [self.bottomBaseView addSubview:self.giftBtn];
    [self.bottomBaseView addSubview:self.shareBtn];
    
    [self.bottomBaseView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.height.equalTo(@70.f);
    }];
    [self.shareBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.offset(0);
        make.right.offset(-60.f);
    }];
    [self.giftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.offset(0);
        make.right.equalTo(self.shareBtn.mas_left).offset(-10.f);
    }];
    [self.messageBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.offset(0);
        make.right.equalTo(self.giftBtn.mas_left).offset(-10.f);
    }];
    [self.chatBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(10.f);
        make.centerY.offset(0);
    }];
}


#pragma mark - GETTER SETTER
-(UIView *)bottomBaseView {
    if (!_bottomBaseView) {
        _bottomBaseView = [UIView new];
    }
    return _bottomBaseView;
}

-(UIButton *)chatBtn {
    if (!_chatBtn) {
        _chatBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_chatBtn setImage:[UIImage imageNamed:@"mg_room_btn_liao_h"] forState:UIControlStateNormal];
//        [_chatBtn sizeToFit];
        
    }
    return _chatBtn;
}
-(UIButton *)messageBtn {
    if (!_messageBtn) {
        _messageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_messageBtn setImage:[UIImage imageNamed:@"mg_room_btn_xinxi_h"] forState:UIControlStateNormal];
//        [_messageBtn sizeToFit];
    }
    return _messageBtn;
}

-(UIButton *)giftBtn {
    if (!_giftBtn) {
        _giftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_giftBtn setImage:[UIImage imageNamed:@"mg_room_btn_liwu_h"] forState:UIControlStateNormal];
//        [_giftBtn sizeToFit];
    }
    return _giftBtn;
}
-(UIButton *)shareBtn {
    if (!_shareBtn) {
        _shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_shareBtn setImage:[UIImage imageNamed:@"mg_room_btn_fenxiang_h"] forState:UIControlStateNormal];
    }
    return _shareBtn;
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
