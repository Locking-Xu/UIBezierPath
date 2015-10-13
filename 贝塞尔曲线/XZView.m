//
//  XZView.m
//  贝塞尔曲线
//
//  Created by 徐章 on 15/10/13.
//  Copyright © 2015年 xuzhang. All rights reserved.

#import "XZView.h"

@implementation XZView

- (id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.backgroundColor = [UIColor lightGrayColor];
    }
    
    return self;
}

- (void)drawRect:(CGRect)rect{
    
    /*
    //绘制直线
    [self createLine];
    
    //创建矩形
    [self createRect:CGRectMake(50, 100, 50, 50)];
    
    //创建内切曲线
    [self createOvalInRect:CGRectMake(50, 200, 50, 50)];
    
    //创建带有圆角的矩形，当矩形变成正圆的时候，Radius就不再起作用
    [self createRoundedInRect:CGRectMake(50, 300, 50, 50) radius:15.0f];
    
    //设定特定的角为圆角的矩形
    [self createRoundedInRect:CGRectMake(50, 400, 50, 50) roundingCorners:UIRectCornerBottomLeft cornerRadii:CGSizeMake(5,5)];
    
    //创建圆弧
    [self createArcCenter:CGPointMake(100, 550) radius:25 startAngle:0 endAngle:1.5*M_PI clockwise:YES];
    
    //通过路径A创建路径B
    [self createWithPath];
    
    //创建三次贝塞尔曲线
    [self createCurveToPoint:CGPointMake(400, 200) controlPoint1:CGPointMake(250, 150) controlPoint2:CGPointMake(350, 250)];
    
    //创建二次贝塞尔曲线
    [self createQuadCurveToPoint:CGPointMake(300, 300) controlPoint:CGPointMake(250, 350)];
    
    //添加圆弧
    [self createAddArcWithCenter:CGPointMake(200, 400) radius:25 startAngle:0 endAngle:1.5*M_PI clockwise:YES];
    
    //追加路径
    [self appendPath];
    
    //创建翻转路径，即起点变成终点，终点变成起点
    [self createReversingPath];
    
    //路径进行仿射变换
    [self createApplyTransform];
    
    //创建虚线
    CGFloat dashStyle[] = {1.0f, 2.0f};
    [self createLineDash:dashStyle count:2 phase:0.0];
    
    //设置颜色
    [self setLineColor:[UIColor greenColor] fillColor:[UIColor redColor]];
    
    //设置描边混合模式
    [self setStrokeWithBlendMode];
    
    //设置描边混合模式
    [self setFillWithBlendMode];
    
    //修改当前图形上下文的绘图区域可见,随后的绘图操作导致呈现内容只有发生在指定路径的填充区域
    [self createAddClip];
    */
}

/**
 *  绘制直线
 */
- (void)createLine{
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path moveToPoint:CGPointMake(50, 50)];
    [path addLineToPoint:CGPointMake(100, 50)];
    
    path.lineWidth = 5.0f;
    
    path.lineJoinStyle = kCGLineJoinRound;
    
    [path stroke];
}

/**
 *  创建矩形
 */
- (void)createRect:(CGRect)rect{

    UIBezierPath *path = [UIBezierPath bezierPathWithRect:rect];
    
    path.lineWidth = 5.0f;
    
    [path stroke];
}

/**
 *  创建内切曲线
 */
- (void)createOvalInRect:(CGRect)rect{
    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:rect];
    
    path.lineWidth = 5.0f;
    
    [path stroke];
}

/**
 *  创建带有圆角的矩形，当矩形变成正圆的时候，Radius就不再起作用
 */
- (void)createRoundedInRect:(CGRect)rect radius:(CGFloat)radius{
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius];
    
    path.lineWidth = 5.0f;
    
    [path stroke];
}

/**
 *  设定特定的角为圆角的矩形
 *  @param corners     指定的圆角
 *  @param cornerRadii 圆角的大小
 */
- (void)createRoundedInRect:(CGRect)rect roundingCorners:(UIRectCorner)corners cornerRadii:(CGSize)cornerRadii{
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corners cornerRadii:cornerRadii];
    
    path.lineWidth = 5.0f;
    
    [path stroke];
}

/**
 *  创建圆弧
 *
 *  @param center     圆点
 *  @param radius     半径
 *  @param startAngle 起始位置
 *  @param endAngle   结束为止
 *  @param clockwise  是否顺时针方向
 */
- (void)createArcCenter:(CGPoint)center radius:(CGFloat)radius startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle clockwise:(BOOL)clockwise{

    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:clockwise];
    
    path.lineWidth = 5.0f;
    
    [path stroke];
}

/**
 *  通过路径A创建路径B
 */
- (void)createWithPath{

    UIBezierPath *path_A = [UIBezierPath bezierPath];
    
    [path_A moveToPoint:CGPointMake(200, 50)];
    
    [path_A addLineToPoint:CGPointMake(250, 100)];
    
    path_A.lineWidth = 5.0f;

    UIBezierPath *path_B = [UIBezierPath bezierPathWithCGPath:path_A.CGPath];
    
    [path_B stroke];
    
}

/**
 *  创建二次贝塞尔曲线
 *
 *  @param endPoint     终点
 *  @param controlPoint 控制点
 */
- (void)createQuadCurveToPoint:(CGPoint)endPoint controlPoint:(CGPoint)controlPoint{
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path moveToPoint:CGPointMake(200, 300)];
    
    [path addQuadCurveToPoint:endPoint controlPoint:controlPoint];
    
    [path stroke];
}

/**
 *  创建三次贝塞尔曲线
 *
 *  @param endPoint      终点
 *  @param controlPoint1 控制点1
 *  @param controlPoint2 控制点2
 */
- (void)createCurveToPoint:(CGPoint)endPoint controlPoint1:(CGPoint)controlPoint1 controlPoint2:(CGPoint)controlPoint2{

    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path moveToPoint:CGPointMake(200, 200)];
    
    [path addCurveToPoint:endPoint controlPoint1:controlPoint1 controlPoint2:controlPoint2];
    
    [path stroke];
}

/**
 *  添加圆弧
 *
 *  @param center     圆点
 *  @param radius     半径
 *  @param startAngle 起始位置
 *  @param endAngle   结束为止
 *  @param clockwise  是否顺时针方向
 */
- (void)createAddArcWithCenter:(CGPoint)center radius:(CGFloat)radius startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle clockwise:(BOOL)clockwise{

    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path moveToPoint:CGPointMake(200, 400)];
    [path addLineToPoint:CGPointMake(225, 410)];
    
    [path addArcWithCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:clockwise];
    
    [path closePath];
    
    [path removeAllPoints];
    
    [path stroke];
}

/**
 *  追加路径
 */
- (void)appendPath{

    UIBezierPath *path_A = [UIBezierPath bezierPath];
    
    [path_A moveToPoint:CGPointMake(200, 500)];
    [path_A addLineToPoint:CGPointMake(225, 410)];
    
    UIBezierPath *path_B = [UIBezierPath bezierPath];
    
    [path_B moveToPoint:CGPointMake(200, 600)];
    [path_B addLineToPoint:CGPointMake(225, 500)];
    
    [path_A appendPath:path_B];
    
    [path_A stroke];
}

/**
 *  创建翻转路径，即起点变成终点，终点变成起点
 */
- (void)createReversingPath{
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path moveToPoint:CGPointMake(50, 50)];
    [path addLineToPoint:CGPointMake(100, 50)];
    
    path.lineWidth = 5.0f;
    
    NSLog(@"%@",NSStringFromCGPoint(path.currentPoint));
    
    UIBezierPath *path_b = [path bezierPathByReversingPath];
    
    NSLog(@"%@",NSStringFromCGPoint(path_b.currentPoint));
    
    [path_b stroke];
}

/**
 *  路径进行仿射变换
 */
- (void)createApplyTransform{
    
    CGAffineTransform transform = CGAffineTransformMakeScale(2, 2);
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path moveToPoint:CGPointMake(50, 50)];
    [path addLineToPoint:CGPointMake(100, 50)];
    
    [path applyTransform:transform];
    
    path.lineWidth = 5.0f;
    
    [path stroke];
    
}

/**
 *  创建虚线
 *
 *  @param pattern C类型线性数据
 *  @param count   pattern中数据个数
 *  @param phase   起始位置
 */
- (void)createLineDash:(nullable const CGFloat *)pattern count:(NSInteger)count phase:(CGFloat)phase{
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path moveToPoint:CGPointMake(50, 50)];
    [path addLineToPoint:CGPointMake(100, 50)];
    
    [path setLineDash:pattern count:count phase:0.0];
    
    [path stroke];
}

/**
 *  设置颜色
 *
 *  @param lineColor 线条颜色
 *  @param fillColor 填充颜色
 */
- (void)setLineColor:(UIColor *)lineColor fillColor:(UIColor *)fillColor{

    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(100, 100, 100, 100)];
    
    [lineColor setStroke];
    
    [fillColor setFill];
    
    [path stroke];
    [path fill];
}

/**
 *  设置描边混合模式
 *  @param  CGBlendMode 混合模式
 *  @param  alpha   透明度
 */
- (void)setFillWithBlendMode{
    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(100, 100, 100, 100)];
    
    [[UIColor redColor] setFill];
    
    [path fillWithBlendMode:kCGBlendModeSaturation alpha:0.6];
    
    [path fill];

}

/**
 *  设置描边混合模式
 *  @param  CGBlendMode 混合模式
 *  @param  alpha   透明度
 */
- (void)setStrokeWithBlendMode{

    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(100, 100, 100, 100)];
    
    [[UIColor greenColor] setStroke];
    
    path.lineWidth = 10.0f;
    
    [path strokeWithBlendMode:kCGBlendModeSaturation alpha:1.0];
    
    [path stroke];
}

/**
 *  修改当前图形上下文的绘图区域可见,随后的绘图操作导致呈现内容只有发生在指定路径的填充区域
 */
- (void)createAddClip{
    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(100, 100, 100, 100)];
    
    [[UIColor greenColor] setStroke];
    
    [path addClip];
    
    [path stroke];
    
}
@end
