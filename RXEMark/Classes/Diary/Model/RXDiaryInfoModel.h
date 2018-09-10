//
//  RXDiaryInfoModel.h
//  RXEMark
//
//  Created by 星仔 on 2018/8/26.
//  Copyright © 2018年 pingan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "RXAutoCoding.h"
@interface RXDiaryInfoModel : RXAutoCoding

@property (nonatomic, assign) NSInteger diaryId;
@property (nonatomic, copy)   NSString  *diaryDate;
@property (nonatomic, copy)   NSString  *diaryContent;
@property (nonatomic, strong) UIImage   *diaryMiddleImage;
@property (nonatomic, strong) UIImage   *diaryImage;


@end
