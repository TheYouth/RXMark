//
//  RXPlaceHolderTextView.h
//  RXEMark
//
//  Created by pingan on 2018/10/15.
//  Copyright © 2018年 pingan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RXPlaceHolderTextView : UITextView

@property(nonatomic, copy)NSString *placeHolder;

- (instancetype)initWithFrame:(CGRect)frame placeHolderPosition:(CGPoint)position;

@end

NS_ASSUME_NONNULL_END
