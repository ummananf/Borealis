//
//  UserInfo.h
//  iPad
//
//  Created by Mark Grushevski on 2015-03-29.
//  Copyright (c) 2015 Francis Manansala. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfo : NSObject {
    NSString *username;
    NSString *firstName;
    NSString *lastName;
    NSString *ID;
    NSString *email;
    NSString *degree;
    NSString *welcome;
}

@property (nonatomic , retain) NSString *username;
@property (nonatomic , retain) NSString *firstName;
@property (nonatomic , retain) NSString *lastName;
@property (nonatomic , retain) NSString *ID;
@property (nonatomic , retain) NSString *email;
@property (nonatomic , retain) NSString *degree;
@property (nonatomic , retain) NSString *welcome;

+(UserInfo*) getInstance;

- (void) parseDictionary: (NSDictionary*) dictionary;

@end
