//
//  RXBaseNavVC.m
//  RXEMark
//
//  Created by 星仔 on 2018/8/5.
//  Copyright © 2018年 pingan. All rights reserved.
//

#import "RXBaseNavVC.h"
#import "EMTheme.h"
@interface RXBaseNavVC ()

@end

@implementation RXBaseNavVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationBar.translucent = NO;
    EMTheme *emTheme = [EMTheme shareTheme];
    self.navigationBar.tintColor = emTheme.navTintColor;
    self.navigationBar.barTintColor = emTheme.navBarBGColor;
    self.navigationBar.titleTextAttributes = @{NSFontAttributeName:emTheme.navTitleFont,NSForegroundColorAttributeName:emTheme.navTintColor};
    [self.navigationBar setShadowImage:[UIImage new]];
    [self.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
}
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
@end
