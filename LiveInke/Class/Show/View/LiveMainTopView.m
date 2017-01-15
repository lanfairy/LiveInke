//
//  LiveMainTopView.m
//  LiveInke
//
//  Created by 张俊伟 on 2017/1/15.
//  Copyright © 2017年 lanfairy. All rights reserved.
//

#import "LiveMainTopView.h"
@interface LiveMainTopView()
@property (nonatomic, weak) UIView *lineView;

@end
@implementation LiveMainTopView
{
    CGFloat _width;
}
//tapMainTopViewBlock:(TapMainTopView)block
- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles {
  
    if (self = [super initWithFrame:frame]) {
        
        
        CGFloat btnW = self.width / titles.count;
        CGFloat btnH = self.height;
        _width = btnW;
        CGFloat btnX;
        
        for (int i = 0; i < titles.count; i++) {
            
            UIButton *titleButton = [UIButton buttonWithType:UIButtonTypeCustom];
            
//            [self.buttons addObject:titleButton];
            
            
            titleButton.tag = i;
            
            NSString * vcName = titles[i];
            
            [titleButton setTitle:vcName forState:UIControlStateNormal];
            // 设置标题颜色
            [titleButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            
            // 设置标题字体
            titleButton.titleLabel.font = [UIFont systemFontOfSize:18];
            
            btnX = i * btnW;
            
            titleButton.frame = CGRectMake(btnX, 0, btnW, btnH);
            
            // 监听按钮点击
            [titleButton addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
            
            [self addSubview:titleButton];
            
            if (i == 0) {
                // 添加下划线
                // 下划线宽度 = 按钮文字宽度
                // 下划线中心点x = 按钮中心点x
                
                CGFloat h = 2;
                CGFloat y = 35 ;
                
                // 先计算文字尺寸,在给label去赋值
                [titleButton.titleLabel sizeToFit];
                
                UIView * lineView =[[UIView alloc] init];
                // 位置和尺寸
                lineView.height = h;
                lineView.width = titleButton.titleLabel.width;
                lineView.centerX = titleButton.centerX;
                lineView.top = y;
                lineView.backgroundColor = [UIColor whiteColor];
                
                self.lineView = lineView;
                
                [self addSubview:self.lineView];
                
            }
        }
    }

    
    return self;
}

- (void)titleClick:(UIButton*)btn {
    if (self.block) {
        self.block(btn.tag);
    }
    
    [UIView animateWithDuration:0.5f animations:^{
        self.lineView.centerX = btn.centerX;
    }];
}

- (void)drawSlipViewContentOffSet:(CGFloat)scale {
    self.lineView.transform = CGAffineTransformMakeTranslation((_width)*scale, 0);
}
@end
