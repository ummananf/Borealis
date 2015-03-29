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
NSMutableArray *tableData;
static NSString *simpleTableIdentifier = @"SimpleTableItem";

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
    
    tableData = [[NSMutableArray alloc] init];
    NSNumber *value = [NSNumber numberWithInt:UIInterfaceOrientationLandscapeLeft];
    [[UIDevice currentDevice] setValue:value forKey:@"orientation"];
    
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
    
    [tableData removeAllObjects];
    
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
        
        CourseCell *cell = [[CourseCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
        cell.courseId.text = [key valueForKey:@"cID"];
        cell.crn.text = [key valueForKey:@"crn"];
        cell.section.text = [key valueForKey:@"sectID"];
        cell.capacity.text = [NSString stringWithFormat:@"%@",[key valueForKey:@"maxSize"]];
        cell.days.text = [key valueForKey:@"days"];
        cell.startTime.text = [key valueForKey:@"startTime"];
        cell.endTime.text = [key valueForKey:@"endTime"];
        cell.location.text = [key valueForKey:@"location"];
        
        [tableData addObject:cell];
        
        index++;
    }
    
    [_courseTable reloadData];
    
}

- (IBAction)backClicked:(id)sender {
    [self performSegueWithIdentifier:@"RegisterCorses_Home" sender:self];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableData != nil) {
        return [tableData count];
    }
    
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CourseCell *cell = (CourseCell*)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [tableData objectAtIndex:indexPath.row];
    }
    
    return cell;
}

@end
