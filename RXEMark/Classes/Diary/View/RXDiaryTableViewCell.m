//
//  RXDiaryTableViewCell.m
//  RXEMark
//
//  Created by 星仔 on 2018/8/21.
//  Copyright © 2018年 pingan. All rights reserved.
//

#import "RXDiaryTableViewCell.h"
#import "RXVerticallyAlignedLabel.h"
@interface RXDiaryTableViewCell()
@property (nonatomic, strong) RXVerticallyAlignedLabel *contentLabel;
@property (nonatomic, strong) UILabel                  *dateLabel;
@property (nonatomic, strong) UILabel                  *yearLabel;
@property (nonatomic, strong) UIImageView              *picImageView;
@end
@implementation RXDiaryTableViewCell

- (void)setInfoModel:(RXDiaryInfoModel *)infoModel{
    _infoModel = infoModel;
    
}

@end
