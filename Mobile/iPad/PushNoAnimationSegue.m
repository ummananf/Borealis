//
//  PushNoAnimationSegue.m
//  iPad
//
//  Created by Francis Manansala on 2015-03-28.
//  Copyright (c) 2015 Francis Manansala. All rights reserved.
//

#import "PushNoAnimationSegue.h"

@implementation PushNoAnimationSegue

- (void) perform{
    [[[self sourceViewController] navigationController] pushViewController:[self destinationViewController] animated:NO];
}
@end
