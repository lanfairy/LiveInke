//
//  LiveLiveHandler.m
//  LiveInke
//
//  Created by 张俊伟 on 2017/1/17.
//  Copyright © 2017年 lanfairy. All rights reserved.
//

#import "LiveLiveHandler.h"
#import "LiveHttpTool.h"
#import "LiveTop.h"
@implementation LiveLiveHandler
+(void)executeGetHotLiveTaskWithSuccess:(SuccessBlock)success Failed:(FailedBlock)failed {
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:@"" forKey:@"imsi"];
    [params setObject:@"17800399" forKey:@"uid"];
    [params setObject:@"5" forKey:@"proto"];
    [params setObject:@"A1205EB8-0C9A-4131-A2A2-27B9A1E06622" forKey:@"idfa"];
    [params setObject:@"0000000000000026" forKey:@"lc"];
    [params setObject:@"TG0001" forKey:@"cc"];
    [params setObject:@"" forKey:@"imei"];
    [params setObject:@"20i0a3GAvc8ykfClKMAen8WNeIBKrUwgdG9whVJ0ljXi1Af8hQci3" forKey:@"sid"];
    [params setObject:@"IK3.1.00_Iphone" forKey:@"cv"];
    [params setObject:@"bcb94097c7a3f3314be284c8a5be2aaeae66d6ab" forKey:@"devi"];
    [params setObject:@"Wifi" forKey:@"conn"];
    [params setObject:@"iPhone" forKey:@"ua"];
    [params setObject:@"DEBAD23B-7C6A-4251-B8AF-A95910B778B7" forKey:@"idfv"];
    [params setObject:@"ios_9.300000" forKey:@"osversion"];
    [params setObject:@"5" forKey:@"count"];
    [params setObject:@"1" forKey:@"multiaddr"];
   
    [LiveHttpTool getWithPath:API_LiveGetTop params:params success:^(id json) {
        if ([json[@"dm_error"] integerValue]) {
            failed(json[@"error_msg"]);
        }else{
            NSArray *liveTops = [LiveTop mj_objectArrayWithKeyValuesArray:json[@"lives"]];
            success(liveTops);
        }
            
    } failure:^(NSError *error) {
        failed(error);
    }];
}
@end
