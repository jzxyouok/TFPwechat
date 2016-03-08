//
//  TFPImage.m
//  TFPwechat
//
//  Created by foscam-hwh on 16/3/5.
//  Copyright © 2016年 foscam-hwh. All rights reserved.
//

#import "TFPImage.h"

@implementation TFPImage

+(UIImage *)reSizeImage:(UIImage *)image toSize:(CGSize)reSize
{
    UIGraphicsBeginImageContext(CGSizeMake(reSize.width, reSize.height));
    [image drawInRect:CGRectMake(0, 0, reSize.width, reSize.height)];
    UIImage *reSizeImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return reSizeImage;
}

@end
