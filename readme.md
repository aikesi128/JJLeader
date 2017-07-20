#新手引导页 lead use
---

## 功能

* 快速引导用户熟悉app的使用，及各个功能点的位置
* 使用第三方字体
* 内部已经对位置进行判定，无需后续处理
* 方便使用

## 展示
![](https://github.com/Joyce-X/JJLeader/blob/master/JJLeader/send.gif?raw=true)

## 使用

* 只需要传入显示的文字，和高亮区域显示为圆形或者举行的枚举和高亮位置即可
* 可以在一个控制器中连续使用，只需要在handler回调中进行嵌套
* 也可以分别在不同的控制器进行调用，可以在回调中切换控制器

[JJLeadTool presentLeadWithMessage:@"如果还可以请点个星星" frame:CGRectMake(300, 400, 70, 70) lightType:JJHelightTypeCircle completionHandler:nil];


