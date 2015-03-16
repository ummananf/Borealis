//
//  TabBarControllerDelegate.m
//  iPad
//
//  Created by Francis Manansala on 2015-03-15.
//  Copyright (c) 2015 Francis Manansala. All rights reserved.
//

#import "TabBarControllerDelegate.h"

@implementation TabBarControllerDelegate

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    NSLog(@"TabBarControllerDelegate");
    
    if ([viewController.title  isEqual: @"Home"]) {
        NSLog(@"HOME");
    } else if ([viewController.title isEqual: @"MyInfo"]){
        NSLog(@"MYINFO");
    }
    
}

@end
