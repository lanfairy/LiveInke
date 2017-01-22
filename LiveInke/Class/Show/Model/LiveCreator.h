//
//  LiveCreator.h
//  LiveInke
//
//  Created by 张俊伟 on 2017/1/21.
//  Copyright © 2017年 lanfairy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LiveCreator : NSObject
@property (nonatomic, strong) NSString * birth;
@property (nonatomic, copy) NSString * desc;
@property (nonatomic, copy) NSString * emotion;
@property (nonatomic, assign) NSInteger gender;
@property (nonatomic, assign) NSInteger gmutex;
@property (nonatomic, strong) NSString * hometown;
@property (nonatomic, assign) NSInteger ID;
@property (nonatomic, assign) NSInteger inkeVerify;
@property (nonatomic, assign) NSInteger level;
@property (nonatomic, copy) NSString * location;
@property (nonatomic, copy) NSString * nick;
@property (nonatomic, copy) NSString * portrait;
@property (nonatomic, copy) NSString * profession;
@property (nonatomic, assign) NSInteger rankVeri;
@property (nonatomic, assign) NSInteger sex;
@property (nonatomic, copy) NSString * thirdPlatform;
@property (nonatomic, copy) NSString * veriInfo;
@property (nonatomic, assign) NSInteger verified;
@property (nonatomic, copy) NSString * verifiedReason;
@end
