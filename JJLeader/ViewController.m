//
//  ViewController.m
//  JJLeader
//
//  Created by x on 17/7/20.
//  Copyright © 2017年 cesiumai. All rights reserved.
//

#import "ViewController.h"
#import "JJLeadTool.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor brownColor];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    //!< 用法1
    [JJLeadTool presentLeadWithMessage:@"点击这里可以胡混一色" frame:CGRectMake(50, 50, 60 , 48) lightType:JJHelightTypeRect completionHandler:^{
        
        
        [JJLeadTool presentLeadWithMessage:@"点击这里可以胡十三幺" frame:CGRectMake(300, 100, 70, 70) lightType:JJHelightTypeCircle completionHandler:^{
            
            [JJLeadTool presentLeadWithMessage:@"点击这里年薪三十万" frame:CGRectMake(20, 370, 90, 44) lightType:JJHelightTypeRect completionHandler:^{
                [JJLeadTool presentLeadWithMessage:@"如果还可以请点个星星" frame:CGRectMake(300, 400, 70, 70) lightType:JJHelightTypeCircle completionHandler:^{
                    
                    
                }];
                
            }];
            
        }];
        
        
    }];
    
    //!< 用法2
    
//    __weak typeof(self) wself = self;
//    [JJLeadTool presentLeadWithMessage:@"点击这里你就阵亡了,咋胡" frame:CGRectMake(-30, 300, 88 , 99) lightType:JJHelightTypeRect completionHandler:^{
//        
//        wself.tabBarController.selectedIndex = 1;
//        
//        
//    }];
    
    

}

@end
