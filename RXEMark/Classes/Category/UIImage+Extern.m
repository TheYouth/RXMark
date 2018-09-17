//
//  UIImage+Extern.m
//  RXEMark
//
//  Created by pingan on 2018/9/14.
//  Copyright © 2018年 pingan. All rights reserved.
//

#import "UIImage+Extern.h"

@implementation UIImage (Extern)
- (UIImage *)aspectResizeWithWidth:(CGFloat)width{
    CGFloat height = self.size.height * width / self.size.width;
    UIGraphicsBeginImageContext(CGSizeMake(width, height));
    [self drawInRect:CGRectMake(0, 0, width, height)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}
@end
