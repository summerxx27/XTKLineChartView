//
//  XTKViewBase.h
//  XTKLineChartView
//
//  Created by zjwang on 16/11/10.
//  Copyright © 2016年 summerxx.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XTKViewBase : UIView
@property (nonatomic, assign) CGRect contentRect;
@property (nonatomic, assign) CGFloat chartHeight;
@property (nonatomic, assign) CGFloat chartWidth;


/**
 创建ChartView

 @param left   距左
 @param top    距上
 @param right  距右
 @param bottom 距下
 */
- (void)xt_createChartOffsetWithLeft:(CGFloat)left
                                 top:(CGFloat)top
                               right:(CGFloat)right
                              bottom:(CGFloat)bottom;

/**
 通知数据改变的方法
 */
- (void)xt_notifyDataSetChanged;

/**
 通知设备方向改变
 */
- (void)xt_notifyDeviceOrientationChanged;

- (void)xt_isInBoundsX:(CGFloat)x;
- (void)xt_isInBoundsY:(CGFloat)y;
- (BOOL)xt_isInBoundsX:(CGFloat)x
                     y:(CGFloat)y;

- (BOOL)xt_isInBoundsLeft:(CGFloat)leftX;
- (BOOL)xt_isInBoundsRight:(CGFloat)rightX;

- (BOOL)xt_isInBoundsTop:(CGFloat)y;

- (BOOL)xt_isInBoundsBottom:(CGFloat)y;

/**
 返回 contentRect.origin.y

 @return res
 */
- (CGFloat)xt_contentTop;

/**
 返回 contentRect.origin.x

 @return res
 */
- (CGFloat)xt_contentLeft;
/**
 返回 contentRect.origin.x + width
 
 @return res
 */
- (CGFloat)xt_contentRight;
/**
 返回 contentRect.origin.y + height
 
 @return res
 */
- (CGFloat)xt_contentBottom;
/**
 返回 size.width
 
 @return res
 */
- (CGFloat)xt_contentWidth;

/**
 返回 size.height

 @return res
 */
- (CGFloat)xt_contentHeight;
@end
