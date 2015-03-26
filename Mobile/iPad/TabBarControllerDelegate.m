//
//  TabBarControllerDelegate.m
//  iPad
//
//  Created by Francis Manansala on 2015-03-15.
//  Copyright (c) 2015 Francis Manansala. All rights reserved.
//

#import "TabBarControllerDelegate.h"

@implementation TabBarControllerDelegate
@synthesize testInt;

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *) viewController{
    
    NSLog(@"testInt: %d", testInt);
        
    if ([viewController.title  isEqual: @"Home"]) {
        NSLog(@"HOME");
        NSLog(@"testInt: %d", testInt);
    } else if ([viewController.title isEqual: @"MyInfo"]){
        NSLog(@"MYINFO");
    }
    
}

- (void) setTestInt: (int) value {
    testInt = value;
}

@end
