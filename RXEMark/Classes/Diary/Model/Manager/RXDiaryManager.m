//
//  RXDiaryManager.m
//  RXEMark
//
//  Created by pingan on 2018/9/11.
//  Copyright © 2018年 pingan. All rights reserved.
//

#import "RXDiaryManager.h"

@implementation RXDiaryManager

+ (instancetype)shareManager{
    static RXDiaryManager *_manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        _manager = [[RXDiaryManager alloc] init];
    });
    return _manager;
}
@end
