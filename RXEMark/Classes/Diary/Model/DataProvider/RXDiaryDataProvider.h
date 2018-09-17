//
//  RXDiaryDataProvider.h
//  RXEMark
//
//  Created by pingan on 2018/9/14.
//  Copyright © 2018年 pingan. All rights reserved.
//

#import "RXBaseDataBaseCommonProvider.h"
#import "RXDiaryInfo.h"
@interface RXDiaryDataProvider : RXBaseDataBaseCommonProvider

- (NSArray<RXDiaryInfo *> *)selectDiaryInfosFromStart:(NSInteger)startIndex
                                           totalCount:(NSInteger)totalCount;

- (UIImage *)selectImageWithDiaryId:(NSInteger)diaryId;

@end
