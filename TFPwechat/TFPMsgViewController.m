//
//  TFPMsgViewController.m
//  TFPwechat
//
//  Created by foscam-hwh on 16/3/5.
//  Copyright © 2016年 foscam-hwh. All rights reserved.
//

#import "TFPMsgViewController.h"

@interface TFPMsgViewController ()

@end

@implementation TFPMsgViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    UINavigationController *navigationCtrl = [[UINavigationController alloc] init];
//    [navigationCtrl.view setBackgroundColor:[UIColor blackColor]];
//    self.navigationController = navigationCtrl;
//    [self addChildViewController:navigationCtrl];
    //self.title = @"dsfgh";
    self.navigationController.title = @"dgfd";
    [self.view setBackgroundColor:[UIColor orangeColor]];
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
