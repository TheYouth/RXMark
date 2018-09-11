//
//  RXBaseDataBaseProvider.h
//  RXEMark
//
//  Created by pingan on 2018/9/11.
//  Copyright © 2018年 pingan. All rights reserved.
//

#import "RXBaseDataProvider.h"
#import "RXDataBase.h"
@protocol EMBaseDataBaseProvider<RXBaseDataProvider>

- (BOOL)onCreateTable:()db;

@end

@interface RXBaseDataBaseProvider : RXBaseDataProvider



@end
