//
//  HTTP.h
//  iPad
//
//  Created by Mark Grushevski on 2015-03-30.
//  Copyright (c) 2015 Francis Manansala. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTTP : NSObject

+ (NSDictionary*) post: (NSString*) endpoint : (NSString*) params;

@end
