//
//  RXHomeCollectionViewCell.m
//  RXEMark
//
//  Created by 星仔 on 2018/8/20.
//  Copyright © 2018年 pingan. All rights reserved.
//

#import "RXHomeCollectionViewCell.h"
#import "EMTheme.h"
#import "Masonry.h"
@interface RXHomeCollectionViewCell()
@property (nonatomic, strong) UILabel      *mainTitle;
@end
@implementation RXHomeCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        self.mainTitle = [UILabel new];
        self.mainTitle.font = [EMTheme shareTheme].navTitleFont;
        self.mainTitle.textColor = [UIColor whiteColor];
        self.mainTitle.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.mainTitle];
        __weak typeof(self)weakSelf = self;
        [self.mainTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(weakSelf.contentView);
        }];
    }
    return self;
}
- (void)updateCellWithTitle:(NSString *)title{
    self.mainTitle.text = title;
    UIColor *bgColor;
    if ([title isEqualToString:NSLocalizedString(@"日记", nil)]) {
        bgColor = UIColorFromHexRGB(0x00BEFE);
    } else if ([title isEqualToString:NSLocalizedString(@"账单", nil)]) {
        bgColor = UIColorFromHexRGB(0xFD2B61);
    } else if ([title isEqualToString:NSLocalizedString(@"节日", nil)]) {
        bgColor = UIColorFromHexRGB(0x7ABA00);
    } else if ([title isEqualToString:NSLocalizedString(@"收纳", nil)]) {
        bgColor = UIColorFromHexRGB(0xFF8001);
    } else if ([title isEqualToString:NSLocalizedString(@"提醒", nil)]) {
        bgColor = UIColorFromHexRGB(0xB01F00);
    } else if ([title isEqualToString:NSLocalizedString(@"设置", nil)]) {
        bgColor = UIColorFromHexRGB(0x8C88FE);
    }
    
    self.contentView.backgroundColor = bgColor;
}
@end
