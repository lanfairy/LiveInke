//
//  LiveMainTopView.h
//  LiveInke
//
//  Created by 张俊伟 on 2017/1/15.
//  Copyright © 2017年 lanfairy. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^TapMainTopView)(NSInteger index);
@interface LiveMainTopView : UIView
- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles;// tapMainTopViewBlock:(TapMainTopView)block;

@property (nonatomic, copy) TapMainTopView block;

- (void)drawSlipViewContentOffSet:(CGFloat)scale;
@end
