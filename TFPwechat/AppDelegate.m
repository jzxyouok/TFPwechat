//
//  AppDelegate.m
//  TFPwechat
//
//  Created by foscam-hwh on 16/3/5.
//  Copyright © 2016年 foscam-hwh. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //1.创建Window
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    
    //a.初始化一个tabBar控制器
    UITabBarController *tabBarCtrl=[[UITabBarController alloc]init];
    
    //设置控制器为Window的根控制器
    //self.window.rootViewController=tabBarCtrl;
    
//    UINavigationController
    UINavigationController *navigationCtrl = [[UINavigationController alloc] init];
//    [navigationCtrl.navigationController.view setBackgroundColor:[UIColor blackColor]];
    [navigationCtrl.view setBackgroundColor:[UIColor blueColor]];
    [navigationCtrl setTitle:@"12345"];
    
    self.window.rootViewController = navigationCtrl;
//    [UIView animateWithDuration:0.5 animations:^{
//        //
//    }];
    self.window.rootViewController=navigationCtrl;
    
    [navigationCtrl pushViewController:tabBarCtrl animated:YES];
    
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:23/255.0 green:180/255.0 blue:237/255.0 alpha:1]];
    
//    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:0  green:0 blue:0 alpha:0.4]];
    
    tabBarCtrl.title = @"微信";
//    [tabBarCtrl.view setBackgroundColor:[UIColor blackColor]];
//    NSLog(@"%@", navigationCtrl.navigationController);
    
    //[tabBarCtrl.navigationController addSubview:navigationCtrl.view];
    
//    [self.window.rootViewController.view addSubview:navigationCtrl.view];
    
//    [tabBarCtrl.navigationController.view setBackgroundColor:[UIColor blackColor]];
//    [tabBarCtrl.navigationController.view setFrame:CGRectMake(0, 0, tabBarCtrl.view.frame.size.width/5, tabBarCtrl.view.frame.size.height)];
//    self.window.rootViewController = navigationCtrl;
    
//    [self.window addSubview:tabBarCtrl];
//    [self.window.rootViewController.navigationController addChildViewController:tabBarCtrl];
    


    
    
    //b.创建子控制器
    //第一个view
    TFPMsgViewController *msgViewCtrl = [[TFPMsgViewController alloc] init];
    msgViewCtrl.tabBarItem.title = @"微信";
    msgViewCtrl.view.backgroundColor = [UIColor whiteColor];
    msgViewCtrl.tabBarItem.image = [TFPImage reSizeImage:[UIImage imageNamed:@"msg_normal.png"] toSize:CGSizeMake(38.4, 33.6)];
    [msgViewCtrl.tabBarItem setSelectedImage:[TFPImage reSizeImage:[UIImage imageNamed:@"msg_pressed.png"] toSize:CGSizeMake(38.4, 33.6)]];
    msgViewCtrl.tabBarItem.badgeValue = @"111";
    msgViewCtrl.title = @"微信";
    [msgViewCtrl.view setBackgroundColor:[UIColor orangeColor]];
    
    //第二个view
    TFPAddressBookViewController *addressBookViewCell = [[TFPAddressBookViewController alloc] init];
    addressBookViewCell.tabBarItem.title = @"通讯录";
    addressBookViewCell.view.backgroundColor = [UIColor whiteColor];
    addressBookViewCell.tabBarItem.image = [TFPImage reSizeImage:[UIImage imageNamed:@"address_book_normal.png"] toSize:CGSizeMake(38.4, 33.6)];
    [addressBookViewCell.tabBarItem setSelectedImage:[TFPImage reSizeImage:[UIImage imageNamed:@"address_book_normal.png"] toSize:CGSizeMake(38.4, 33.6)]];
    [addressBookViewCell.view setBackgroundColor:[UIColor darkGrayColor]];

    
    //第三个view
    TFPFindViewController *findViewCell = [[TFPFindViewController alloc] init];
    findViewCell.tabBarItem.title = @"发现";
    findViewCell.view.backgroundColor = [UIColor whiteColor];
    findViewCell.tabBarItem.image = [TFPImage reSizeImage:[UIImage imageNamed:@"find_normal.png"] toSize:CGSizeMake(38.4, 33.6)];
    [findViewCell.tabBarItem setSelectedImage:[TFPImage reSizeImage:[UIImage imageNamed:@"find_normal.png"] toSize:CGSizeMake(38.4, 33.6)]];
    [findViewCell.view setBackgroundColor:[UIColor brownColor]];

    
    //第四个view
    TFPSetViewController *setViewCell = [[TFPSetViewController alloc] init];
    setViewCell.tabBarItem.title = @"我";
    setViewCell.view.backgroundColor = [UIColor whiteColor];
    setViewCell.tabBarItem.image = [TFPImage reSizeImage:[UIImage imageNamed:@"set_normal.png"] toSize:CGSizeMake(38.4, 33.6)];
    [setViewCell.tabBarItem setSelectedImage:[TFPImage reSizeImage:[UIImage imageNamed:@"set_normal.png"] toSize:CGSizeMake(38.4, 33.6)]];
    [setViewCell.view setBackgroundColor:[UIColor purpleColor]];

    
    tabBarCtrl.viewControllers = @[msgViewCtrl,addressBookViewCell,findViewCell,setViewCell];
    tabBarCtrl.delegate = self;
    
    tabBarCtrl.edgesForExtendedLayout = UIRectEdgeNone;

    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    NSInteger index = tabBarController.selectedIndex;
    NSString *strTitle;
    switch (index) {
        case 0:
            strTitle = @"微信";
            break;
        case 1:
            strTitle = @"通讯录";
            break;
        case 2:
            strTitle = @"发现";
            break;
        case 3:
            strTitle = @"我";
            break;
            
        default:
            break;
    }
    //tabBarController.title = strTitle;
    //self.window.
    //self.window.rootViewController.title = strTitle;
    tabBarController.title = strTitle;
    
}

@end
