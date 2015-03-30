//
//  HTTP.m
//  iPad
//
//  Created by Mark Grushevski on 2015-03-30.
//  Copyright (c) 2015 Francis Manansala. All rights reserved.
//

#import "HTTP.h"
#import "SBJson.h"

@implementation HTTP

NSString *siteURL = @"http://awstest-fa5gzzwmbd.elasticbeanstalk.com/";

+ (NSDictionary*) post: (NSString*) endpoint : (NSString*) params {
    
    NSString *fullURL = [NSString stringWithFormat:@"%@%@", siteURL, endpoint];
    NSURL *url=[NSURL URLWithString:fullURL];
    NSData *postData = [params dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:url];
    [request setValue:@"YES" forHTTPHeaderField:@"IOS"];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setHTTPBody:postData];
    NSHTTPURLResponse *requestResponse;
    NSData *requestHandler = [NSURLConnection sendSynchronousRequest:request returningResponse:&requestResponse error:nil];
    NSString *requestReply = [[NSString alloc] initWithBytes:[requestHandler bytes] length:[requestHandler length] encoding:NSASCIIStringEncoding];
    SBJsonParser *jsonParser = [SBJsonParser new];
    NSDictionary *jsonData = (NSDictionary *) [jsonParser objectWithString:requestReply error:nil];
    
    return jsonData;
}

@end
