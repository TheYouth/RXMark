//
//  RXSplash.m
//  RXEMark
//
//  Created by 星仔 on 2018/8/5.
//  Copyright © 2018年 pingan. All rights reserved.
//

#import "RXSplashVC.h"
#import "EMTheme.h"
#import "RXHomeVC.h"
#import "RXBaseNavVC.h"
@interface RXSplashVC ()<UITextFieldDelegate>

@property (nonatomic, strong) UIImageView      *imageView;
@end

@implementation RXSplashVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUI];
    __weak typeof(self)weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [weakSelf showHomeVC];
    });

}
- (void)setUI{
    self.view.backgroundColor = [EMTheme shareTheme].navTintColor;
    UIWindow *windows = [UIApplication sharedApplication].delegate.window;
    [windows addSubview:self.imageView];
}
- (void)showHomeVC{
    RXHomeVC *homeVC = [[RXHomeVC alloc] init];
    RXBaseNavVC *baseNavVC = [[RXBaseNavVC alloc] initWithRootViewController:homeVC];
    baseNavVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:baseNavVC animated:YES completion:nil];
    
    [UIView animateWithDuration:0.3 animations:^{
        self.imageView.alpha = 0;
    }completion:^(BOOL finished) {
        [self.imageView removeFromSuperview];
    }];
}
- (UIImageView *)imageView{
    if (!_imageView) {
        UIWindow *mainWindows = [UIApplication sharedApplication].delegate.window;
        _imageView = [[UIImageView alloc] initWithFrame:mainWindows.bounds];
        _imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _imageView.image = [self launchImage];
    }
    return _imageView;
}
- (UIImage *)launchImage{
    UIImage *image = nil;
    if (IS_3_5_INCH) {
        image = [UIImage imageNamed:@"LaunchImage-700"];
    }else if (IS_4_0_INCH){
        image = [UIImage imageNamed:@"LaunchImage-700-568h"];
    }else if (IS_4_7_INCH){
        image = [UIImage imageNamed:@"LaunchImage-800-667h"];
    }else if (IS_5_5_INCH){
        image = [UIImage imageNamed:@"LaunchImage-800-Portrait-736h"];
    }
    return image;
}
@end
