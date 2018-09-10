//
//  EMTheme.h
//  RXEMark
//
//  Created by 星仔 on 2018/8/8.
//  Copyright © 2018年 pingan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Masonry.h"
@interface EMTheme : NSObject

@property (nonatomic, strong) UIColor *navBarBGColor;
@property (nonatomic, strong) UIColor *navTintColor;
@property (nonatomic, strong) UIColor *mainBGColor;
@property (nonatomic, strong) UIColor *dividerColor;
@property (nonatomic, strong) UIFont  *navTitleFont;

+ (instancetype)shareTheme;

UIColor *UIColorFromHexRGB(NSInteger hexRGB);
UIColor *UICOLORFromAHexRGB(CGFloat alpha, NSInteger hexRGB);
#define IS_3_5_INCH          ([[UIScreen mainScreen] bounds].size.width == 320 && [[UIScreen mainScreen] bounds].size.height == 480 ? YES:NO)
#define IS_4_0_INCH          ([[UIScreen mainScreen] bounds].size.width == 320 && [[UIScreen mainScreen] bounds].size.height == 568 ? YES:NO)
#define IS_4_7_INCH          ([[UIScreen mainScreen] bounds].size.width == 375 && [[UIScreen mainScreen] bounds].size.height == 667 ? YES:NO)
#define IS_5_5_INCH          ([[UIScreen mainScreen] bounds].size.width == 414 && [[UIScreen mainScreen] bounds].size.height == 736 ? YES:NO)
@end
