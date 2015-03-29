//
//  RegisterViewController.m
//  iPad
//
//  Created by Mark Grushevski on 2015-03-29.
//  Copyright (c) 2015 Francis Manansala. All rights reserved.
//

#import "RegisterViewController.h"
#import "SBJson.h"
#import "CourseCell.h"

@implementation RegisterViewController

NSString *currentTerm = nil;
NSString *currentCategory = nil;
NSArray *tableData;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    
    _courseTable.delegate = self;
    _courseTable.dataSource = self;
    
    [_termControl setSelected:NO];
    
    [_categoryControl setHidden:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changedSegment:(id)sender {
    

    if (_termControl.selectedSegmentIndex == 0) {
        currentTerm = @"fall2014";
    } else {
        currentTerm = @"winter2015";
    }
    
    NSURL *url=[NSURL URLWithString:@"http://awstest-fa5gzzwmbd.elasticbeanstalk.com/registerCourses"];
    NSString *post =[[NSString alloc] initWithFormat:@"termName=%@", currentTerm];
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:url];
    [request setValue:@"YES" forHTTPHeaderField:@"IOS"];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setHTTPBody:postData];
    
    NSHTTPURLResponse *requestResponse;
    NSData *requestHandler = [NSURLConnection sendSynchronousRequest:request returningResponse:&requestResponse error:nil];
    
    NSString *requestReply = [[NSString alloc] initWithBytes:[requestHandler bytes] length:[requestHandler length] encoding:NSASCIIStringEncoding];
    NSLog(@"requestRply: %@", requestReply);
    
    
    // parse the response
    
    SBJsonParser *jsonParser = [SBJsonParser new];
    NSDictionary *jsonData = (NSDictionary *) [jsonParser objectWithString:requestReply error:nil];
    
    // remove default segments in the category segment controler
    [_categoryControl removeAllSegments];
    
    // add segments
    int index = 0;
    for (id key in jsonData) {
        NSArray *degreeArray = [jsonData objectForKey:key];
        NSString *degree = [degreeArray valueForKey:@"degName"];
        
        NSLog(@"%@", degree);
        
        [_categoryControl insertSegmentWithTitle:degree atIndex:index animated:NO];
        
        // sets the size for each segment, but must resize the width of the segment controller in the storyboard to be wider otherwise the added segments won't be clickable
       [_categoryControl setWidth:160 forSegmentAtIndex:index];
        
        index++;
    }
    
    // fits all segments, but when selected, they contract
//    [_categoryControl sizeToFit];
    
    
    [_categoryControl setHidden:NO];

}

- (IBAction)categoryChangedSegment:(id)sender {
    currentCategory = [_categoryControl titleForSegmentAtIndex:_categoryControl.selectedSegmentIndex];
    NSString *post =[[NSString alloc] initWithFormat:@"termName=%@&categoryName=%@", currentTerm, currentCategory];
    NSURL *url=[NSURL URLWithString:@"http://awstest-fa5gzzwmbd.elasticbeanstalk.com/registerCourses"];
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:url];
    [request setValue:@"YES" forHTTPHeaderField:@"IOS"];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setHTTPBody:postData];
    NSHTTPURLResponse *requestResponse;
    NSData *requestHandler = [NSURLConnection sendSynchronousRequest:request returningResponse:&requestResponse error:nil];
    NSString *requestReply = [[NSString alloc] initWithBytes:[requestHandler bytes] length:[requestHandler length] encoding:NSASCIIStringEncoding];
    NSLog(@"requestRply: %@", requestReply);
    
    
    SBJsonParser *jsonParser = [SBJsonParser new];
    NSDictionary *jsonData = (NSDictionary *) [jsonParser objectWithString:requestReply error:nil];
    
    
    int index = 0;
    for (id key in jsonData) {
        NSArray *courseArray = [jsonData objectForKey:key];
        NSString *degree = [courseArray valueForKey:@"degName"];
        
        NSLog(@"%@", degree);
        
        [_categoryControl insertSegmentWithTitle:degree atIndex:index animated:NO];
        
        // sets the size for each segment, but must resize the width of the segment controller in the storyboard to be wider otherwise the added segments won't be clickable
        [_categoryControl setWidth:160 forSegmentAtIndex:index];
        
        index++;
    }
    
    UITableViewCell *cell = [UITableViewCell alloc];

    tableData = [NSArray arrayWithObjects:cell, nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    CourseCell *cell = (CourseCell*)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[CourseCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.courseId.text = @"course id";
    cell.crn.text = @"crn";
    cell.capacity.text = @"capacity";
    return cell;
}

@end
