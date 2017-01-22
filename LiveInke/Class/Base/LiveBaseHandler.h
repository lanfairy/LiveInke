//
//  LiveBaseHandler.h
//  LiveInke
//
//  Created by 张俊伟 on 2017/1/17.
//  Copyright © 2017年 lanfairy. All rights reserved.
//

#import <Foundation/Foundation.h>
//处理完成事件
typedef void(^CompleteBlock)();
//处理事件成功
typedef void(^SuccessBlock)(id obj);
//处理事件失败
typedef void(^FailedBlock)(id obj);
@interface LiveBaseHandler : NSObject

@end
