//
//  NoAnimationSegue.m
//  iPad
//
//  Created by Francis Manansala on 2015-03-28.
//  Copyright (c) 2015 Francis Manansala. All rights reserved.
//

#import "NoAnimationSegue.h"

@implementation NoAnimationSegue

- (void) perform{
    [[[self sourceViewController] navigationController] pushViewController:[self destinationViewController] animated:NO];
}

@end
