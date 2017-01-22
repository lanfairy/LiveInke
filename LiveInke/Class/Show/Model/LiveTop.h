//
//  LiveTop.h
//  LiveInke
//
//  Created by 张俊伟 on 2017/1/21.
//  Copyright © 2017年 lanfairy. All rights reserved.
//

#import <Foundation/Foundation.h>
@class LiveCreator;
@interface LiveTop : NSObject
@property (nonatomic, copy) NSString * city;
@property (nonatomic, strong) LiveCreator * creator;
@property (nonatomic, assign) NSInteger group;
@property (nonatomic, assign) NSInteger ID;
@property (nonatomic, copy) NSString * image;
@property (nonatomic, assign) NSInteger link;
@property (nonatomic, assign) NSInteger multi;
@property (nonatomic, copy) NSString * name;
@property (nonatomic, assign) NSInteger onlineUsers;
@property (nonatomic, assign) NSInteger optimal;
@property (nonatomic, assign) NSInteger pubStat;
@property (nonatomic, assign) NSInteger roomId;
@property (nonatomic, assign) NSInteger rotate;
@property (nonatomic, copy) NSString * shareAddr;
@property (nonatomic, assign) NSInteger slot;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, copy) NSString * streamAddr;
@property (nonatomic, assign) NSInteger tagId;
@property (nonatomic, copy) NSString * token;
@property (nonatomic, assign) NSInteger version;

@end
