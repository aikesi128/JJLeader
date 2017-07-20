//
//  JJLeadView.m
//  delete
//
//  Created by X on 2017/7/19.
//  Copyright © 2017年 ~X~. All rights reserved.
//

#import "JJLeadTool.h"

#define LabelW 320
#define LabelH 44
#define ArrowW 90  //3:2比例
#define ArrowH 60

static JJLeadTool *shareManager;

@interface JJLeadTool ()

@property (nonatomic,copy)CallBack callBack;//-- 点击回调

@end

@implementation JJLeadTool

+ (instancetype)shareManager{

    if (shareManager == nil)
    {
        shareManager = [JJLeadTool new];
    }

    return shareManager;

}

+ (void)presentLeadWithMessage:(NSString *)message frame:(CGRect)rect lightType:(JJHelightType)type completionHandler:(CallBack)handler
{
    JJLeadTool *manager = [self shareManager];
    
    manager.callBack = handler;
    
    //!< 创建view并添加手势
    CGRect frame = [UIScreen mainScreen].bounds;
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
  
    view.backgroundColor = [UIColor colorWithRed:50/255.0 green:50/255.0 blue:50/255.0 alpha:0.8];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapTrigger:)];
    
    [view addGestureRecognizer:tap];
    
    [[UIApplication sharedApplication].keyWindow addSubview:view];
    
    
    //!< 创建path
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:[UIScreen mainScreen].bounds];
    
    //!< 宽高和中心点
    CGFloat width = rect.size.width;
    
    CGFloat height = rect.size.height;

    CGFloat centerX = rect.origin.x + width * 0.5;
    
    CGFloat centerY = rect.origin.y + height * 0.5;
    
    CGPoint center = CGPointMake(centerX, centerY);
    
    //!< 显示文字和图片
    UIImageView *iv = [UIImageView new];
    
    UILabel *label = [UILabel new];
    
    //!< 可以在这里切换字体
    label.font = [UIFont fontWithName:@"Wawati SC" size:27];

    label.adjustsFontSizeToFitWidth = YES;
    
    label.text = message;

    label.textAlignment = NSTextAlignmentCenter;

    label.textColor = [UIColor whiteColor];
    
    [view addSubview:iv];
    
    [view addSubview:label];
    
    
    //!< 根据高亮的类型添加不同的path
    if (type == JJHelightTypeRect)
    {
        //-- 矩形
        [path appendPath:[[UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:5] bezierPathByReversingPath]];
        
        [self layoutArrow:iv andLabel:label WithRect:rect type:JJHelightTypeRect];
        
    }else
    {
        CGFloat radius = width == height ? width * 0.5: MIN(width, height) * 0.5;
  
        //-- 圆形
        [path appendPath:[UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:0 endAngle:M_PI * 2 clockwise:NO]];
        
        [self layoutArrow:iv andLabel:label WithRect:rect type:JJHelightTypeCircle];
        
    }

    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    
    shapeLayer.path = path.CGPath;
    
    [view.layer setMask:shapeLayer];


}

+ (void)layoutArrow:(UIImageView*)iv andLabel:(UILabel *)label WithRect:(CGRect)rect type:(JJHelightType)type
{
    
    //!< 宽高 起点
    CGFloat width = rect.size.width;
    
    CGFloat height = rect.size.height;
    
    CGFloat apexX = rect.origin.x;
    
    CGFloat apexY = rect.origin.y;
    
    //!< 高亮区域中心点
    CGFloat centerX = rect.origin.x + width * 0.5;
    
    CGFloat centerY = rect.origin.y + height * 0.5;
  
     //!< 屏幕中心点
    CGPoint centerScreen = CGPointMake([UIScreen mainScreen].bounds.size.width/2, [UIScreen mainScreen].bounds.size.height/2);
 
    CGFloat labelX,labelY,ivX,ivY;
    
    //!< 按照区域设置图片和Label的frame
    if(centerX <= centerScreen.x)
    {
        //!< 在屏幕左半边
        
        if(centerY <= centerScreen.y)
        {
            //!< 屏幕左上部分
            iv.image = [UIImage imageNamed:@"lead_leftUp"];
            ivX = apexX + width / 2;
            ivY = apexY + height;
            
            labelX = ivX + ArrowW - LabelW / 2;
            labelY = ivY + ArrowH;
        
        }else
        {
            //!< 屏幕左下部分
            iv.image = [UIImage imageNamed:@"lead_leftBottom"];
            
            ivX = apexX + width / 2;
            ivY = apexY - ArrowH;
            labelX = ivX + ArrowW - LabelW / 2;
            labelY = ivY - LabelH;
        
        
        }
    
    
    }else
    {
        //!< 屏幕右半边
        if(centerY <= centerScreen.y)
        {
            //!< 屏幕右上部分
            iv.image = [UIImage imageNamed:@"lead_rightUp"];
            
            ivX = centerX - ArrowW;
            ivY = apexY + height;
            labelX = ivX - LabelW / 2;
            labelY = ivY + ArrowH;
            
            
        }else
        {
            //!< 屏幕右下部分
            iv.image = [UIImage imageNamed:@"lead_rightBottom"];
            
            ivX = centerX - ArrowW;
            ivY = apexY - ArrowH;
            labelX = ivX  - LabelW / 2;
            labelY = ivY - LabelH;
            
            
        }
    
    
    
    
    }
    
    
    if (labelX < 0)
    {
        labelX = 20;
        
        label.textAlignment = NSTextAlignmentRight;
    }
    
    if ((labelX + LabelW) > [UIScreen mainScreen].bounds.size.width)
    {
        //!< 超出右边边界
        float increment = labelX + LabelW - [UIScreen mainScreen].bounds.size.width;
        
        labelX -= (increment + 30);
        
    }
    
    iv.frame = CGRectMake(ivX, ivY, ArrowW, ArrowH);
    
    label.frame = CGRectMake(labelX, labelY, LabelW, LabelH);
    
   
   
    

    
}


+ (void)tapTrigger:(UITapGestureRecognizer *)tap
{
    
    NSLog(@"tapTrigger");
    
    UIView *view = tap.view;
    
    [view removeFromSuperview];
    
    JJLeadTool *manager = [self shareManager];
    if (manager.callBack)manager.callBack();
  
//    manager.callBack = nil;
    
}



@end
