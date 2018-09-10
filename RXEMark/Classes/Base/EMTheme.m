//
//  EMTheme.m
//  RXEMark
//
//  Created by 星仔 on 2018/8/8.
//  Copyright © 2018年 pingan. All rights reserved.
//

#import "EMTheme.h"

@implementation EMTheme

- (instancetype)init{
    if (self = [super init]) {
        self.navBarBGColor = UIColorFromHexRGB(0x38383B);
        self.navTintColor = [UIColor whiteColor];
        self.mainBGColor = UIColorFromHexRGB(0xEEEEF4);
        self.dividerColor =  UIColorFromHexRGB(0xD8D9D8);
        self.navTitleFont = [UIFont boldSystemFontOfSize:18.0];
    }
    return self;
}
+ (instancetype)shareTheme{
   static EMTheme *theme = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        theme = [[EMTheme alloc] init];
    });
    return theme;
}
UIColor *UIColorFromHexRGB(NSInteger hexRGB){
    return UICOLORFromAHexRGB(1.0, hexRGB);
}
UIColor *UICOLORFromAHexRGB(CGFloat alpha, NSInteger hexRGB){
      return [UIColor colorWithRed:((float)((hexRGB & 0xFF0000) >> 16))/255.0
                             green:((float)((hexRGB & 0xFF00) >> 8))/255.0
                              blue:((float)(hexRGB & 0xFF))/255.0
                             alpha:1.0];
}
@end
