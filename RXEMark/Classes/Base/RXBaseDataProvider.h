//
//  RXBaseDataProvider.h
//  RXEMark
//
//  Created by pingan on 2018/9/11.
//  Copyright © 2018年 pingan. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol RXBaseDataProvider <NSObject>

//子类需要重写
@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, assign, readonly) NSInteger  version;


@end

@interface RXBaseDataProvider : NSObject<RXBaseDataProvider>

@end
