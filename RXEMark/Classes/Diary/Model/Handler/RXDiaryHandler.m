//
//  RXDiaryHandler.m
//  RXEMark
//
//  Created by pingan on 2018/9/12.
//  Copyright © 2018年 pingan. All rights reserved.
//

#import "RXDiaryHandler.h"
#import "EMQueueDef.h"
#import "RXDiaryInfo.h"
@interface RXDiaryHandler()

@property (nonatomic, strong) RXDiaryDataProvider    *dataProvider;


@end
@implementation RXDiaryHandler

- (void)fetchDiaryInfoWithStartIndex:(NSInteger)index totalCount:(NSInteger)totalCount result:(RXResultBlock)resultBlock{
    
    __weak typeof (self) weakSelf = self;
    dispatch_async_in_queue(self.handleQueue, ^{
        NSArray<RXDiaryInfo *> *diaryInfo = [weakSelf.dataProvider selectDiaryInfosFromStart:index
                                                                                  totalCount:totalCount];
        RXResult *result = [RXResult new];
        result.result = diaryInfo;
        
        if (nil == weakSelf || nil == resultBlock) {
            return ;
        }
        __strong typeof(weakSelf) strongSelf = weakSelf;
        dispatch_async_in_queue(strongSelf.callBackQueue, ^{
            resultBlock(result);
        });
    });
}
@end
