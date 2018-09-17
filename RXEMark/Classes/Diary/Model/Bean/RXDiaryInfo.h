//
//  RXDiaryInfo.h
//  RXEMark
//
//  Created by pingan on 2018/9/11.
//  Copyright © 2018年 pingan. All rights reserved.
//

#import "RXAutoCoding.h"
#import <UIKit/UIKit.h>
@interface RXDiaryInfo : RXAutoCoding

@property (nonatomic, assign) NSInteger  diaryId;
@property (nonatomic, copy) NSString     *diaryDate;
@property (nonatomic, copy) NSString     *diaryContent;
@property (nonatomic, strong) UIImage    *diaryMiddleImage;
@property (nonatomic, strong) UIImage    *diaryImage;



@end
