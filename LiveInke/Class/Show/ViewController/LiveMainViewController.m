//
//  LiveMainViewController.m
//  LiveInke
//
//  Created by 张俊伟 on 2017/1/15.
//  Copyright © 2017年 lanfairy. All rights reserved.
//

#import "LiveMainViewController.h"
#import "LiveMainTopView.h"
@interface LiveMainViewController ()<UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *contentScrollView;
@property (nonatomic, strong) LiveMainTopView *mainTopView;
@property (nonatomic, strong) NSArray *datalist;
@end

@implementation LiveMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUpSubViews];
    [self setUpLayout];
    
    [self setUpChildViewControllers];
    
    [self scrollViewDidEndScrollingAnimation:self.contentScrollView];
}

- (void)setUpSubViews {
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationItem.titleView = self.mainTopView;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"global_search"] style:UIBarButtonItemStyleDone target:nil action:nil];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"title_button_more"] style:UIBarButtonItemStyleDone target:nil action:nil];
    [self.view addSubview:self.contentScrollView];
    
    
    
}

- (void)setUpLayout {
    WS(weakSelf)
    [self.contentScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(weakSelf.view);
    }];
}

- (void)setUpChildViewControllers {
    NSArray *array = @[@"LiveFocuseViewController",@"LiveHotViewController",@"LiveNearViewController"];
    for (NSInteger i=0; i<array.count; i++) {
        UIViewController *vc = [[NSClassFromString(array[i]) alloc] init];
        vc.title = self.datalist[i];
        [self addChildViewController:vc];
    }
}

#pragma mark - GETTER
-(LiveMainTopView *)mainTopView {
    if (!_mainTopView) {
        _mainTopView = [[LiveMainTopView alloc] initWithFrame:CGRectMake(0, 0, 200, 44.f) titles:self.datalist];
        @weakify(self);
        _mainTopView.block = ^(NSInteger index) {
            @strongify(self);
            CGPoint point = CGPointMake(index*ScreenWidth, self.contentScrollView.contentOffset.y);
            [self.contentScrollView setContentOffset:point animated:YES];
        };
    }
    return _mainTopView;
}

-(UIScrollView *)contentScrollView {
    if (!_contentScrollView) {
        _contentScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
        _contentScrollView.backgroundColor = [UIColor whiteColor];
        _contentScrollView.pagingEnabled = YES;
        _contentScrollView.delegate = self;
        _contentScrollView.contentSize = CGSizeMake(ScreenWidth*self.datalist.count, 0);
        _contentScrollView.contentOffset = CGPointMake(ScreenWidth, 0);
    }
    return _contentScrollView;
}
-(NSArray *)datalist {
    if (!_datalist) {
        _datalist = @[@"关注",@"热门",@"附近"];
    }
    return _datalist;
}

#pragma mark - ScrollViewDelegate 
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    
    CGFloat width = ScreenWidth;
    CGFloat offsetX = scrollView.contentOffset.x;
    NSInteger idx = offsetX / width;
    UIViewController *vc = self.childViewControllers[idx];
    if ([vc isViewLoaded]) {
        return;
    }
    vc.view.frame = CGRectMake(offsetX, 0, width, ScreenHeight);
    [scrollView addSubview:vc.view];
    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat scale = scrollView.contentOffset.x / ScreenWidth;
    NSLog(@"scale--%f",scale);
    if (scale < 0 || scale >  self.datalist.count-1) return;

    [self.mainTopView drawSlipViewContentOffSet:scale];
    
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    [self scrollViewDidEndScrollingAnimation:scrollView];
}
@end
