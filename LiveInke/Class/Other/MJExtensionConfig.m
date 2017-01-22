//
//  MJExtensionConfig.m
//  LiveInke
//
//  Created by 张俊伟 on 2017/1/21.
//  Copyright © 2017年 lanfairy. All rights reserved.
//

#import "MJExtensionConfig.h"
#import "LiveTop.h"
#import "LiveCreator.h"
@implementation MJExtensionConfig

+(void)load {
   
    
    [NSObject mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 @"ID" : @"id",
                 @"desc" : @"description"
                 };
    }];
    [LiveTop mj_setupReplacedKeyFromPropertyName121:^id(NSString *propertyName) {
        return [propertyName mj_underlineFromCamel];
    }];
    
    [LiveCreator mj_setupReplacedKeyFromPropertyName121:^id(NSString *propertyName) {
        return [propertyName mj_underlineFromCamel];
    }];
    
}
@end
