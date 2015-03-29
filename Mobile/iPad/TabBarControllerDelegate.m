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

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *) viewController{
    
    //NSLog(@"testInt: %@", jsondata);
        
    if (tabBarController.selectedIndex == 0) {
        NSLog(@"HOME");
    } else if ([viewController.title isEqual: @"MyInfo"]){
        NSLog(@"MYINFO");
    }
    
}
/*
- (void) setTestInt: (NSDictionary *) value {
    jsondata = value;
}
*/

@end
