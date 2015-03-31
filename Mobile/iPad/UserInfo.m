//
//  UserInfo.m
//  iPad
//
//  Created by Mark Grushevski on 2015-03-29.
//  Copyright (c) 2015 Francis Manansala. All rights reserved.
//

#import "UserInfo.h"

@implementation UserInfo

@synthesize username;
@synthesize firstName;
@synthesize lastName;
@synthesize ID;
@synthesize email;
@synthesize degree;
@synthesize welcome;

static UserInfo *instance = nil;

+(UserInfo*) getInstance {
    @synchronized (self) {
        if (instance == nil) {
            instance = [UserInfo new];
        }
    }
    return instance;
}

- (void) parseDictionary: (NSDictionary*) dictionary {
    
    NSArray *key = [dictionary valueForKey:@"username"];
    NSString *aUsername = [key objectAtIndex:0];
    self.username = aUsername;
    
    key = [dictionary valueForKey:@"firstName"];
    NSString *aFirstName = [key objectAtIndex:0];
    self.firstName = aFirstName;
    
    key = [dictionary valueForKey:@"lastName"];
    NSString *aLastName = [key objectAtIndex:0];
    self.lastName = aLastName;
    
    key = [dictionary valueForKey:@"degName"];
    NSString *aDegree = [key objectAtIndex:0];
    self.degree = aDegree;
    
    key = [dictionary valueForKey:@"email"];
    NSString *aEmail = [key objectAtIndex:0];
    self.email = aEmail;
    
    key = [dictionary valueForKey:@"userID"];
    NSString *aID = [key objectAtIndex:0];
    self.ID = [NSString stringWithFormat:@"%@", aID];
}

@end
