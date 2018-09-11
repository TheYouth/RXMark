//
//  RXFileUtil.m
//  RXEMark
//
//  Created by pingan on 2018/9/11.
//  Copyright © 2018年 pingan. All rights reserved.
//

#import "RXFileUtil.h"

@implementation RXFileUtil

+ (NSString *)documentsPath{
    
    static NSString *sDocPath = nil;
    if (nil == sDocPath) {
        NSArray<NSString *> *paths = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
        sDocPath = [paths lastObject];
    }
    return sDocPath;
}
+ (NSString *)libarayPath{
    static NSString * slibarayPath = nil;
    if (nil == slibarayPath) {
        NSArray<NSString *> *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
        slibarayPath = [paths lastObject];
    }
    return slibarayPath;
}
+ (NSString *)dataRootPath{
    
    static NSString * sDataPath = nil;
    if (nil == sDataPath) {
        sDataPath = [[self libarayPath] stringByAppendingPathComponent:@"RXEMark"];
        BOOL isDir = NO;
        BOOL isExists = [[NSFileManager defaultManager] fileExistsAtPath:sDataPath];
        if (!isExists || !isDir) {
            NSError *error = nil;
            BOOL successed = [[NSFileManager defaultManager] createDirectoryAtPath:sDataPath
                                                       withIntermediateDirectories:YES
                                                                        attributes:nil
                                                                             error:&error];
            if (!successed) {
                NSAssert(NO, @"Create data dir failed:%@! %@",sDataPath,error);
                sDataPath = nil;
            }
        }
    }
    return sDataPath;
}
@end
