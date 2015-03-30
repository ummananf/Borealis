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
#import "HTTP.h"

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
    NSDictionary *jsonData = [HTTP post:@"classInfo" :post];
    
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
        [cell.dropButton setTag:cell.crn.text.intValue];
        [cell.dropButton addTarget:self action:@selector(dropClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        [tableData addObject:cell];
    }
    
    [_MyCourses reloadData];
}
- (IBAction)dropClicked:(UIButton*)sender {
    NSString *post =[[NSString alloc] initWithFormat:@"action=drop&crn=%@", [NSString stringWithFormat:@"%d", sender.tag]];
    NSDictionary *jsonData = [HTTP post:@"register" :post];
    
    NSString *msg = [jsonData valueForKey:@"msg"];
    NSString *success = [jsonData valueForKey:@"success"];
    int status = success.intValue;
    
    NSLog(@"drop: %d", status);
    
    if (status == 0) {
        [self alertStatus:[NSString stringWithFormat:@"%@", msg] :@"Error!" :0];
    } else {
        [self alertStatus:[NSString stringWithFormat:@"crn: %d", sender.tag]: @"Successfully dropped!" :0];
    }
    
    // search for the cell of the course we are dropping and remove it from the list, then refresh the list
    MyCoursesCell *cell;
    for (id i in [tableData copy]) {
        cell = (MyCoursesCell *) i;
        if (cell.dropButton.tag == sender.tag) {
            [tableData removeObject:i];
        }
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

- (void) alertStatus:(NSString *)msg :(NSString *)title :(int) tag
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:msg
                                                       delegate:self
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil, nil];
    alertView.tag = tag;
    [alertView show];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MyCoursesCell *cell = (MyCoursesCell*)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    cell = [tableData objectAtIndex:indexPath.row];
    return cell;
}
@end
