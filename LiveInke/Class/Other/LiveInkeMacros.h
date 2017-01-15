//
//  LiveInkeMacros.h
//  LiveInke
//
//  Created by 张俊伟 on 2017/1/15.
//  Copyright © 2017年 lanfairy. All rights reserved.
//

#ifndef LiveInkeMacros_h
#define LiveInkeMacros_h

//
#ifdef DEBUG
#define NSLog(...) NSLog(__VA_ARGS__)
#else
#define NSLog(...)
#endif

// 单例模式
#undef	__AS_SINGLETON
#define __AS_SINGLETON    \
+ (instancetype)sharedInstance; \
+ (void)purgeSharedInstance;

#undef	__DEF_SINGLETON
#define __DEF_SINGLETON \
static dispatch_once_t __singletonToken;     \
static id __singleton__;    \
+ (instancetype)sharedInstance \
{ \
dispatch_once( &__singletonToken, ^{ __singleton__ = [[self alloc] init]; } ); \
return __singleton__; \
}   \
+ (void)purgeSharedInstance \
{   \
__singleton__ = nil;    \
__singletonToken = 0; \
}


#define APP_VERSION ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"])
#define INTERFACE_IDIOM_IS_PHONE ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
#define INTERFACE_IDIOM_IS_PAD   ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
#define IOS_VERSION_10 ([[UIDevice currentDevice] systemVersion].integerValue == 10)

#define SYSTEM_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
#define SYSTEM_VERSION_MORE_THAN_5 (SYSTEM_VERSION >= 5.0)
#define SYSTEM_VERSION_MORE_THAN_6 (SYSTEM_VERSION >= 6.0)
#define SYSTEM_VERSION_MORE_THAN_7 (SYSTEM_VERSION >= 7.0)
#define SYSTEM_VERSION_MORE_THAN_8 (SYSTEM_VERSION >= 8.0)
#define SYSTEM_VERSION_MORE_THAN_9 (SYSTEM_VERSION >= 9.0)

#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define RANDOMCOLOR RGBACOLOR(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255), 1)

#define WS(weakSelf) __weak __typeof(&*self) weakSelf = self;

//iphone宽度比例
#define UIWIDTHSCALEIPHONE ([NSNumber decimalwithFormat:@"0.00" floatValue:(ScreenWidth/(414.f*3))])
//iphone实际宽度
#define UIREALWIDTHIPHONE(width) (ceil(UIWIDTHSCALEIPHONE * (width)))

//iphone高度比例
#define UIHEIGHTSCALEIPHONE ([NSNumber decimalwithFormat:@"0.00" floatValue:(ScreenHeight/(736.f*3))])
//iphone实际高度
#define UIREALHEIGHTIPHONE(height) (ceil(UIHEIGHTSCALEIPHONE * (height)))


//ipad 宽度比例
#define UIWIDTHSCALEIPAD ([NSNumber decimalwithFormat:@"0.00" floatValue:(ScreenWidth/1024.f)])
//ipad 实际宽度
#define UIREALWIDTHIPAD(width) (ceil(UIWIDTHSCALEIPAD * (width)))

//ipad 高度比例
#define UIHEIGHTSCALEIPAD ([NSNumber decimalwithFormat:@"0.00" floatValue:(ScreenHeight/768.f)])
//ipad 实际高度
#define UIREALHEIGHTIPAD(height) (ceil(UIHEIGHTSCALEIPAD * (height)))

//字体大小
#define UIREALFONTOFSIZE(PX) [UIFont systemFontOfSize:(PX * 0.75 * 0.5*(ScreenWidth/414.f))]
#define UIREALFONTSIZEIPAD(PX) [UIFont systemFontOfSize:(PX * 0.75)]

#define KeyWindow [[UIApplication sharedApplication]keyWindow]



#endif /* LiveInkeMacros_h */
