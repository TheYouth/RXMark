//
//  RXDataBase.h
//  RXEMark
//
//  Created by pingan on 2018/9/11.
//  Copyright © 2018年 pingan. All rights reserved.
//

#import <Foundation/Foundation.h>

FOUNDATION_EXTERN NSInteger const kEMInvalidVersion;
@class FMDatabase;
@class FMDatabaseQueue;
@interface RXDataBase : NSObject

@property (nonatomic, readonly) FMDatabaseQueue *dbQueue;
@property (nonatomic, copy) NSString *tag;



@end
