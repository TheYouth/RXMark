//
//  RXResult.h
//  RXEMark
//
//  Created by pingan on 2018/9/12.
//  Copyright © 2018年 pingan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RXResult<__covariant ObjectType> : NSObject

@property (nonatomic, strong) ObjectType result;
@property (nonatomic, strong) NSError    *error;
@property (nonatomic, copy) NSString     *message;

@end

typedef void(^RXResultBlock)(RXResult *result);
