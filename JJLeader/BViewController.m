//
//  BViewController.m
//  JJLeader
//
//  Created by x on 17/7/20.
//  Copyright © 2017年 cesiumai. All rights reserved.
//

#import "BViewController.h"
#import "JJLeadTool.h"
@interface BViewController ()

@end

@implementation BViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor orangeColor];
    
  

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
      [JJLeadTool presentLeadWithMessage:@"点击这里你就阵亡了清一色" frame:CGRectMake(240, 100, 90, 50) lightType:JJHelightTypeRect completionHandler:nil];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
