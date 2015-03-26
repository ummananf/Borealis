//
//  TabBarControllerDelegate.h
//  iPad
//
//  Created by Francis Manansala on 2015-03-15.
//  Copyright (c) 2015 Francis Manansala. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TabBarControllerDelegate : NSObject <UITabBarControllerDelegate>

@property(nonatomic, assign) int testInt;

- (void) setTestInt: (int) value;

@end
