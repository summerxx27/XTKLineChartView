//
//  XTKViewBase.m
//  XTKLineChartView
//
//  Created by zjwang on 16/11/10.
//  Copyright © 2016年 summerxx.com. All rights reserved.
//

#import "XTKViewBase.h"

@interface XTKViewBase ()
@property (nonatomic, assign) CGFloat offsetLeft;
@property (nonatomic, assign) CGFloat offsetTop;
@property (nonatomic, assign) CGFloat offsetRight;
@property (nonatomic, assign) CGFloat offsetBottom;
@end
@implementation XTKViewBase

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        //
    }
    return self;
}
- (void)xtAddObserver{
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deviceOrientationDidChange:) name:UIDeviceOrientationDidChangeNotification object:nil];
}
- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIDeviceOrientationDidChangeNotification object:nil];
}
- (void)layoutSubviews{
    CGRect bounds = self.bounds;
    if (bounds.size.width != self.chartWidth || bounds.size.height != self.chartHeight) {
        [self xt_notifyDataSetChanged];
    }
}
- (void)setChartDimens:(CGFloat)wight
                height:(CGFloat)height{
    CGFloat offsetLeft = self.offsetLeft;
    CGFloat offsetTop = self.offsetTop;
    CGFloat offsetRight = self.offsetRight;
    CGFloat offsetBottom = self.offsetBottom;
    
    self.chartHeight = height;
    self.chartWidth = wight;
    
}
- (void)restrainViewPortLeft:(CGFloat)offsetLeft
                         top:(CGFloat)offsetTop
                       right:(CGFloat)offsetRight
                      bottom:(CGFloat)offsetBottom{
    _contentRect.origin.x = offsetRight;
    _contentRect.origin.y = offsetTop;
    // width - left - right
    _contentRect.size.width = self.chartWidth - offsetLeft - offsetRight;
    // height - top - bottom
    _contentRect.size.height = self.chartHeight - offsetTop - offsetBottom;
}
#pragma mark -
- (CGFloat)xt_contentTop
{
    return _contentRect.origin.y;
}

- (CGFloat)xt_contentLeft
{
    return _contentRect.origin.x;
}
- (CGFloat)xt_contentRight
{
    return _contentRect.origin.x + _contentRect.size.width;
}
- (CGFloat)xt_contentBottom
{
    return _contentRect.origin.y + _contentRect.size.height;
}
- (CGFloat)xt_contentWidth
{
    return _contentRect.size.width;
}
- (CGFloat)xt_contentHeight
{
    return _contentRect.size.height;
}
@end
