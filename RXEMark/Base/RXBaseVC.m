//
//  RXBaseVC.m
//  RXEMark
//
//  Created by 星仔 on 2018/8/5.
//  Copyright © 2018年 pingan. All rights reserved.
//

#import "RXBaseVC.h"
#import "EMTheme.h"
@interface RXBaseVC ()

@end

@implementation RXBaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [EMTheme shareTheme].mainBGColor;
}
@end
