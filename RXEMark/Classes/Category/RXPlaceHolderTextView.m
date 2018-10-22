//
//  RXPlaceHolderTextView.m
//  RXEMark
//
//  Created by pingan on 2018/10/15.
//  Copyright © 2018年 pingan. All rights reserved.
//

#import "RXPlaceHolderTextView.h"
@interface RXPlaceHolderTextView()

@property(nonatomic, assign)CGPoint position;
@end

@implementation RXPlaceHolderTextView

- (instancetype)init{
    if (self = [super init]) {
        [self initUI];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initUI];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self initUI];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame placeHolderPosition:(CGPoint)position{
    if (self = [super initWithFrame:frame]) {
        [self initUI];
        self.position = position;
    }
    return self;
}
- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextViewTextDidChangeNotification object:nil];
}
- (void)initUI{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextViewTextDidChangeNotification object:nil];
}
#pragma mark - handle methods
- (void)textChange{
    [self setNeedsDisplay];
}
- (void)setText:(NSString *)text{
    [self setNeedsDisplay];
}
- (void)setPlaceHolder:(NSString *)placeHolder{
    _placeHolder = [placeHolder copy];
    [self setNeedsDisplay];
}
- (void)drawRect:(CGRect)rect{
    if (self.text.length) {
        return;
    }
    NSDictionary *attribe = @{NSForegroundColorAttributeName:[UIColor colorWithWhite:0.5 alpha:0.5],NSFontAttributeName:self.font};
    CGFloat rectX = 15;
    CGFloat rectY = 0;
    if (self.position.x) {
        rectX = self.position.x;
    }
    if (self.position.y) {
        rectY = self.position.y;
    }
    CGSize size = [self.placeHolder boundingRectWithSize:CGSizeMake(MAXFLOAT, 0) options:NSStringDrawingTruncatesLastVisibleLine attributes:attribe context:nil].size;
    CGFloat rectW = size.width;
    CGFloat rectH = self.frame.size.height - 2*rectY;
    if (self.textAlignment == NSTextAlignmentRight) {
        rectX = self.frame.size.width - rectX - rectW;
    }
    CGRect frame = CGRectMake(rectX, rectY, rectW, rectH);
    [self.placeHolder drawInRect:frame withAttributes:attribe];
}
@end
