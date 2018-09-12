//
//  RXBaseHandler.h
//  RXEMark
//
//  Created by pingan on 2018/9/12.
//  Copyright © 2018年 pingan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RXBaseHandler : NSObject

//处理Queue，调getter方法会自动生成，也可以通过initWithQueue传入
@property (nonatomic, readonly) dispatch_queue_t    handleQueue;

//回调的Queue,默认为mainQueue
@property (nonatomic, strong) dispatch_queue_t callBackQueue;

/**
 *  初始化
 *
 *  @param queue 查询或者请求的queue
 *
 */
- (instancetype)initWithQueue:(dispatch_queue_t)queue;


@end
