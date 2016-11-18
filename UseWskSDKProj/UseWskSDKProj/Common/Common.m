//
//  Common.m
//  UseWskSDKProj
//
//  Created by 焱 孙 on 2016/11/15.
//  Copyright © 2016年 焱 孙. All rights reserved.
//

#import "Common.h"

@implementation Common

+ (UIImage *)getImageWithColor:(UIColor *)color
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

@end
