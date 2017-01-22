//
//  UIImageView+SDWebImage.m
//  LiveInke
//
//  Created by 张俊伟 on 2017/1/16.
//  Copyright © 2017年 lanfairy. All rights reserved.
//

#import "UIImageView+SDWebImage.h"
#import <UIImageView+WebCache.h>



@implementation UIImageView (SDWebImage)
- (void)downloadImage:(NSString *)url placeholder:(NSString *)imageName {
    
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:imageName] options:SDWebImageRetryFailed|SDWebImageLowPriority];
    
}

- (void)downloadImage:(NSString *)url
          placeholder:(NSString *)imageName
              success:(DownloadImageSuccessBlock)success
               failed:(DownloadImageFailedBlock)failed
             progress:(DownloadImageProgressBlock)progress {
    
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:imageName] options:SDWebImageRetryFailed|SDWebImageLowPriority progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        
        progress(receivedSize * 1.0 / expectedSize);
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        if (error) {
            
            failed(error);
            
        } else {
            
            self.image = image;
            success(image);
        }
        
    }];
    
}

@end
