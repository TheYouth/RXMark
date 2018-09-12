//
//  RXDiaryHandler.h
//  RXEMark
//
//  Created by pingan on 2018/9/12.
//  Copyright © 2018年 pingan. All rights reserved.
//

#import "RXBaseHandler.h"
#import "RXResult.h"
@interface RXDiaryHandler : RXBaseHandler

- (void)fetchDiaryInfoWithStartIndex:(NSInteger)index
                          totalCount:(NSInteger)totalCount
                              result:(RXResultBlock)resultBlock;


@end
