//
//  RXDiaryManager.h
//  RXEMark
//
//  Created by pingan on 2018/9/11.
//  Copyright © 2018年 pingan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RXResult.h"
@interface RXDiaryManager : NSObject

+ (instancetype)shareManager;

- (void)fetchDiaryInfosWithStartIndex:(NSInteger)startIndex
                           totalCount:(NSInteger)totalCount result:(RXResultBlock)resultBlock;

@end
