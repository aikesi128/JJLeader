//
//  JJLeadView.h
//  delete
//
//  Created by X on 2017/7/19.
//  Copyright © 2017年 ~X~. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef  void(^CallBack)(void);

typedef NS_ENUM(NSInteger,JJHelightType){

    JJHelightTypeCircle,//-- 圆形
    JJHelightTypeRect  //-- 矩形

};

@interface JJLeadTool : NSObject


/*
 分析： 需要实现引导界面的内容，需要传入以下参数：
 * 描述的文字
 * 需要高亮的区域
 * 需要高亮的类型 枚举值，如果是圆形的话就会根据传入的大小来确定一个中心点为圆心，并且以最短的一边为直径画圆
 * 一个回调block，保存点击完成后执行的操作
 */


/**
 直接调用类方法展示新手引导界面

 @param message 显示的文字
 @param rect 高亮的区域，以屏幕坐标系为基准坐标系
 @param type 需要高亮区域的类型
 @param handler 点击引导的回调
 */
+ (void)presentLeadWithMessage:(NSString *)message frame:(CGRect)rect lightType:(JJHelightType)type completionHandler:(CallBack)handler;

@end



