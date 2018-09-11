//
//  RXFileUtil.h
//  RXEMark
//
//  Created by pingan on 2018/9/11.
//  Copyright © 2018年 pingan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RXFileUtil : NSObject

//应用Documents 所在目录
+ (NSString *)documentsPath;
//保存应用数据的根目录
+ (NSString *)dataRootPath;
@end
