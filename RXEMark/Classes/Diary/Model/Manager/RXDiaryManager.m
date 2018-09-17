//
//  RXDiaryManager.m
//  RXEMark
//
//  Created by pingan on 2018/9/11.
//  Copyright © 2018年 pingan. All rights reserved.
//

#import "RXDiaryManager.h"
#import "RXDiaryHandler.h"
@interface RXDiaryManager()

@property (nonatomic, strong) RXDiaryHandler *handler;


@end
@implementation RXDiaryManager

+ (instancetype)shareManager{
    static RXDiaryManager *_manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        _manager = [[RXDiaryManager alloc] init];
    });
    return _manager;
}

- (void)fetchDiaryInfosWithStartIndex:(NSInteger)startIndex
                           totalCount:(NSInteger)totalCount
                               result:(RXResultBlock)resultBlock{
    [self.handler fetchDiaryInfoWithStartIndex:startIndex
                                    totalCount:totalCount
                                        result:resultBlock];
    
}

@end
