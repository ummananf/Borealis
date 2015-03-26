//
//  TabBarControllerDelegate.m
//  iPad
//
//  Created by Francis Manansala on 2015-03-15.
//  Copyright (c) 2015 Francis Manansala. All rights reserved.
//

#import "TabBarControllerDelegate.h"

#import "MyInfoViewController.h"

@implementation TabBarControllerDelegate
@synthesize jsondata;

MyInfoViewController *myInfo;

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *) viewController{
    
    NSLog(@"testInt: %@", jsondata);
        
    if (tabBarController.selectedIndex == 0) {
        myInfo = (MyInfoViewController *) viewController;
        myInfo.username.text = @"hello";
        NSLog(@"HOME");
    } else if ([viewController.title isEqual: @"MyInfo"]){
        NSLog(@"MYINFO");
    }
    
}

- (void) setTestInt: (NSDictionary *) value {
    jsondata = value;
}

- (void) viewDidLoad {
    [super viewDidLoad];
    
}

@end
