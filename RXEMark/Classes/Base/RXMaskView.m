//
//  RXMaskView.m
//  RXEMark
//
//  Created by pingan on 2018/9/17.
//  Copyright © 2018年 pingan. All rights reserved.
//

#import "RXMaskView.h"
#import "EMTheme.h"
@interface RXMaskView()

@property (nonatomic, strong) UIView    *bgView;

@end

@implementation RXMaskView

- (void)show{
    UIWindow *windows = [UIApplication sharedApplication].delegate.window;
    [windows addSubview:self.bgView];
}
- (UIView *)bgView{
    if (!_bgView) {
        UIWindow *window = [UIApplication sharedApplication].delegate.window;
        _bgView = [[UIView alloc] initWithFrame:window.bounds];
        _bgView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.6];
        _bgView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:_bgView.bounds];
        CGFloat x = 0;
        if (IS_5_5_INCH) {
            x = window.frame.size.width - 31;
        }else{
            x = window.frame.size.width - 27;
        }
        UIBezierPath *circlePath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(0, 42)
                                                                  radius:20
                                                              startAngle:0
                                                                endAngle:2*M_PI
                                                               clockwise:NO];
        
        [path appendPath:circlePath];
        CAShapeLayer *shapeLayer = [[CAShapeLayer alloc] init];
        shapeLayer.path = path.CGPath;
        _bgView.layer.mask = shapeLayer;
        _bgView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dissmiss)];
        [_bgView addGestureRecognizer:tap];
    }
    return _bgView;
}
- (void)dissmiss{
    [self.bgView removeFromSuperview];
}

@end
