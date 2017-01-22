//
//  LiveHotCell.m
//  LiveInke
//
//  Created by 张俊伟 on 2017/1/21.
//  Copyright © 2017年 lanfairy. All rights reserved.
//

#import "LiveHotCell.h"
#import "LiveTop.h"
#import "LiveCreator.h"


@interface LiveHotCell()
@property (nonatomic, strong) UIView *topView;
@property (nonatomic, strong) UIImageView *achorIcon;
@property (nonatomic, strong) UILabel *achorName;
@property (nonatomic, strong) UILabel *nunOfListen;
@property (nonatomic, strong) UIImageView *bottomView;
@end
@implementation LiveHotCell
+(instancetype)LiveHotCellWithTableView:(UITableView*)tableView {
    static NSString *ID = @"HOTCELL";
    LiveHotCell *hotCell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (!hotCell) {
        hotCell = [[self alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return hotCell;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.topView = [UIView new];
        [self.contentView addSubview:self.topView];
        
        self.achorIcon = [UIImageView new];
        [self.topView addSubview:self.achorIcon];
        CGFloat marg = 10.f;
        CGFloat topViewH = LIVEHOTCELLTOPH;
        CGFloat achorIconRad = (topViewH-2*marg)*0.5f;
        self.achorIcon.layer.cornerRadius = achorIconRad;
        self.achorIcon.layer.masksToBounds = YES;
        
        self.achorName = [UILabel new];
        [self.topView addSubview:self.achorName];
        
        self.nunOfListen = [UILabel new];
        [self.topView addSubview:self.nunOfListen];
        
        self.bottomView = [UIImageView new];
        [self.contentView addSubview:self.bottomView];
//        @weakify(self);
        [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(self);
            make.height.equalTo(@(topViewH));
        }];
        [self.achorIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(marg);
            make.top.offset(marg);
            make.bottom.offset(-marg);
            make.width.equalTo(self.achorIcon.mas_height);
        }];
        
        [self.nunOfListen mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset(10.f);
            make.right.offset(-10.f);
        }];
        
        [self.achorName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset(10.f);
            make.left.equalTo(self.achorIcon.mas_right).offset(10.f);
            
        }];
        
        [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.offset(0.f);
            make.top.equalTo(self.topView.mas_bottom);
            make.height.equalTo(self.bottomView.mas_width);
        }];
    }
    
    return self;
}

- (void)setLiveTop:(LiveTop *)liveTop {
    _liveTop = liveTop;
    NSArray *por = [liveTop.creator.portrait componentsSeparatedByString:@"/"];
    NSString *imagUrl = nil;
    if (por.count>1) {
        imagUrl = liveTop.creator.portrait;
    }else{
//        [self.achorIcon downloadImage:[NSString stringWithFormat:@"%@%@",@"http://img2.inke.cn/",liveTop.creator.portrait] placeholder:@"default_room"];
        imagUrl = [NSString stringWithFormat:@"%@%@",@"http://img2.inke.cn/",liveTop.creator.portrait];
        
    }
//    http://img2.inke.cn/MTQ3ODM2OTg0NDI2OSMyMjMjanBn.jpg
    [self.achorIcon downloadImage:imagUrl placeholder:@"default_room"];
    [self.bottomView downloadImage:imagUrl placeholder:@"default_room"];
    
    self.achorName.text = liveTop.creator.nick;
    self.nunOfListen.text = @(liveTop.onlineUsers).stringValue;
}


@end
