//
//  RXAutoCoding.h
//  RXEMark
//
//  Created by 星仔 on 2018/8/26.
//  Copyright © 2018年 pingan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RXAutoCoding : NSObject<NSSecureCoding>

//coding
+ (NSDictionary *)codableProperties;
- (void)setWithCoder:(NSCoder *)aDecoder;

//property access
- (NSDictionary *)codableProperties;
- (NSDictionary *)dictionaryRepresentation;

//loading /saving

+ (instancetype)objectWithContentsOfFile:(NSString *)filePath;
- (BOOL)writeToFile:(NSString *)filePath atomically:(BOOL)useAuxiliaryFile;
@end

