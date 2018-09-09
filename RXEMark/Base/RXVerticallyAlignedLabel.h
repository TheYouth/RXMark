//
//  RXVerticallyAlignedLabel.h
//  RXEMark
//
//  Created by 星仔 on 2018/8/26.
//  Copyright © 2018年 pingan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef enum{
    VerticalAlignmentTop = 0,
    VerticalAlignmentMiddle,
    VerticalAlignmentBottom
}VerticalAlignment;
@interface RXVerticallyAlignedLabel : UILabel

@property (nonatomic, assign) VerticalAlignment verticalAlignment;


@end
