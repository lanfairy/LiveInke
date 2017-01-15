//
//  LiveTabBar.m
//  LiveInke
//
//  Created by 张俊伟 on 2017/1/15.
//  Copyright © 2017年 lanfairy. All rights reserved.
//

#import "LiveTabBar.h"
@interface LiveTabBar()
@property (nonatomic, strong) UIImageView *tabbarBgView;
@property (nonatomic, strong) NSArray *dataList;
@property (nonatomic, strong) UIButton *lastBtn;
@property (nonatomic, strong) UIButton *cameraBtn;
@end
@implementation LiveTabBar

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.tabbarBgView];
        
        for (int i = 0; i < self.dataList.count; i++) {
            UIButton *item = [UIButton buttonWithType:UIButtonTypeCustom];
            [item setImage:[UIImage imageNamed:self.dataList[i]] forState:UIControlStateNormal];
            [item setImage:[UIImage imageNamed:[self.dataList[i] stringByAppendingString:@"_p"]] forState:UIControlStateSelected];
            [item setImage:[UIImage imageNamed:self.dataList[i]] forState:UIControlStateHighlighted];
            item.tag = LiveItemTypeLive + i;
            item.adjustsImageWhenHighlighted = NO;
            [item addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:item];
            
            if (i==0) {
                item.selected = YES;
                self.lastBtn = item;
            }
            
        }
        
        [self addSubview:self.cameraBtn];
    }
    
    return self;
}

-(void)layoutSubviews {
    [super layoutSubviews];
    
    self.tabbarBgView.frame = self.bounds;
    CGFloat width = self.bounds.size.width / self.dataList.count;
    for (NSInteger i=0; i<self.subviews.count; i++) {
        UIView *btn = self.subviews[i];
        if ([btn isKindOfClass:[UIButton class]]) {
            btn.frame = CGRectMake((btn.tag-LiveItemTypeLive)*width, 0, width, self.bounds.size.height);
        }
    }
    
    [self.cameraBtn sizeToFit];
    self.cameraBtn.center = CGPointMake(self.center.x, self.center.y-15.f);
    
}


- (void)clickItem:(UIButton *)item {

    
    if ([self.delegate respondsToSelector:@selector(tabBar:clickButton:)]) {
        [self.delegate tabBar:self clickButton:item.tag];
    }
    
    !self.liveTabbarBlock ? : self.liveTabbarBlock(self, item.tag);
    //    if (self.liveTabbarBlock) {
    //        self.liveTabbarBlock(self, item.tag);
    //    }
    if (item.tag == LiveItemTypeLaunch) {
        return;
    }
    
    self.lastBtn.selected = NO;
    item.selected = YES;
    self.lastBtn = item;
    [UIView animateWithDuration:0.2f animations:^{
        item.transform = CGAffineTransformMakeScale(1.2f, 1.2f);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2f animations:^{
            item.transform = CGAffineTransformIdentity;
        }];
    }];
}
-(UIImageView *)tabbarBgView {
    if (!_tabbarBgView) {
        _tabbarBgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"global_tab_bg"]];
    }
    return _tabbarBgView;
}

-(NSArray *)dataList {
    if (!_dataList) {
        _dataList = @[@"tab_live",@"tab_me"];
    }
    return _dataList;
}
-(UIButton *)cameraBtn {
    if (!_cameraBtn) {
        _cameraBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cameraBtn setImage:[UIImage imageNamed:@"tab_launch"] forState:UIControlStateNormal];
//        [_cameraBtn sizeToFit];
        _cameraBtn.tag = LiveItemTypeLaunch;
        [_cameraBtn addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cameraBtn;
}

@end
