//
//  MyCoursesViewController.m
//  iPad
//
//  Created by Francis Manansala on 2015-03-28.
//  Copyright (c) 2015 Francis Manansala. All rights reserved.
//

#import "MyCoursesViewController.h"
#import "SBJson.h"
#import "MyCoursesCell.h"

@implementation MyCoursesViewController

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
    NSNumber *value = [NSNumber numberWithInt:UIInterfaceOrientationLandscapeLeft];
    [[UIDevice currentDevice] setValue:value forKey:@"orientation"];
    tableData = [[NSMutableArray alloc] init];
    _MyCourses.delegate = self;
    _MyCourses.dataSource = self;
    
    [tableData removeAllObjects];
    
    NSString *post =[[NSString alloc] initWithFormat:@""];
    NSURL *url=[NSURL URLWithString:@"http://awstest-fa5gzzwmbd.elasticbeanstalk.com/classInfo"];
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
<<<<<<< HEAD
    MyCoursesCell *cell = [[MyCoursesCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    cell.courseId.text = @"Course ID";
    cell.section.text = @"Section";
    cell.courseName.text = @"Course Name";
    cell.creditHR.text = @"Credits";
    cell.days.text = @"Days";
    cell.startTime.text = @"Start Time";
    cell.endTime.text = @"End Time";
    cell.location.text = @"Location";
    [cell.dropButton setBackgroundColor:[UIColor whiteColor]];
    [tableData addObject:cell];
    
    for (id key in jsonData) {
        cell = [[MyCoursesCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
        cell.courseId.text = [[key objectForKey:@"section"] valueForKey:@"cID"];
        cell.crn.text = [key valueForKey:@"crn"];
        cell.section.text = [[key objectForKey:@"section"] valueForKey:@"sectID"];
        cell.courseName.text = [[[key objectForKey:@"section"] valueForKey:@"course"] valueForKey:@"courseName"];
        cell.creditHR.text = [NSString stringWithFormat:@"%@",[[[key objectForKey:@"section"] objectForKey:@"course"] valueForKey:@"creditHrs"]];
        cell.days.text = [[key objectForKey:@"section"] valueForKey:@"days"];
        cell.startTime.text = [[key objectForKey:@"section"] valueForKey:@"startTime"];
        cell.endTime.text = [[key objectForKey:@"section"] valueForKey:@"endTime"];
        cell.location.text = [[key objectForKey:@"section"]valueForKey:@"location"];
=======
    
    for (id key in jsonData) {
        MyCoursesCell *cell = [[MyCoursesCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
        cell.courseId.text = [key valueForKey:@"cID"];
        cell.crn.text = [key valueForKey:@"crn"];
        cell.section.text = [key valueForKey:@"sectID"];
        cell.creditHR.text = [NSString stringWithFormat:@"%@",[[key objectForKey:@"course"] valueForKey:@"creditHrs"]];
        cell.courseName.text = [[key objectForKey:@"course"] valueForKey:@"courseName"];
        cell.days.text = [key valueForKey:@"days"];
        cell.startTime.text = [key valueForKey:@"startTime"];
        cell.endTime.text = [key valueForKey:@"endTime"];
        cell.location.text = [key valueForKey:@"location"];
>>>>>>> parent of a56c542... updated my courses view
        [cell.dropButton setTag:cell.crn.text.intValue];
        [cell.dropButton addTarget:self action:@selector(dropClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        [tableData addObject:cell];
    }
    
    [_MyCourses reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickedBack:(id)sender {
    [self performSegueWithIdentifier:@"MyCourses_Home" sender:self];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableData != nil) {
        return [tableData count];
    }
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MyCoursesCell *cell = (MyCoursesCell*)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    cell = [tableData objectAtIndex:indexPath.row];
    return cell;
}
@end
