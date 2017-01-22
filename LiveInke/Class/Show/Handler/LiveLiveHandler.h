//
//  LiveLiveHandler.h
//  LiveInke
//
//  Created by 张俊伟 on 2017/1/17.
//  Copyright © 2017年 lanfairy. All rights reserved.
//

#import "LiveBaseHandler.h"

@interface LiveLiveHandler : LiveBaseHandler

/**
 获取热闹直播信息
 @param success success description
 @param failed failed description
 */
+(void)executeGetHotLiveTaskWithSuccess:(SuccessBlock)success Failed:(FailedBlock)failed;
@end
