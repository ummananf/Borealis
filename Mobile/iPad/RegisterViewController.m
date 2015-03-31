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
#import "HTTP.h"

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
    
    NSString *post =[[NSString alloc] initWithFormat:@"termName=%@", currentTerm];
    NSDictionary *jsonData = [HTTP post:@"registerCourses" :post];
    
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
       //[_categoryControl setWidth:160 forSegmentAtIndex:index];
    //    [_categoryControl sizeToFit];
        
        index++;
    }
    
    [_categoryControl setHidden:NO];

}

- (IBAction)categoryChangedSegment:(id)sender {
    
    [tableData removeAllObjects];
    
    currentCategory = [_categoryControl titleForSegmentAtIndex:_categoryControl.selectedSegmentIndex];
    NSString *post =[[NSString alloc] initWithFormat:@"termName=%@&categoryName=%@", currentTerm, currentCategory];
    NSDictionary *jsonData = [HTTP post:@"registerCourses" :post];
    
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
        [cell.registerButton setTag:cell.crn.text.intValue];
        [cell.registerButton addTarget:self action:@selector(registerClicked:) forControlEvents:UIControlEventTouchUpInside];
        [cell.dropButton setTag:cell.crn.text.intValue];
        [cell.dropButton addTarget:self action:@selector(dropClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        [tableData addObject:cell];

    }
    
    [_courseTable reloadData];
    
}

- (IBAction)registerClicked:(UIButton*)sender {
    
    NSString *post =[[NSString alloc] initWithFormat:@"action=register&crn=%@", [NSString stringWithFormat:@"%d", sender.tag]];
    NSDictionary *jsonData = [HTTP post:@"register" :post];
    
    NSString *msg = [jsonData valueForKey:@"msg"];
    NSString *success = [jsonData valueForKey:@"success"];
    int status = success.intValue;
    
    if (status == 0) {
        [self alertStatus:[NSString stringWithFormat:@"%@", msg] :@"Error!" :0];
    } else {
        [self alertStatus:[NSString stringWithFormat:@"crn: %d", sender.tag]: @"Successfully registered!" :0];
    }
}

- (IBAction)dropClicked:(UIButton*)sender {
    NSString *post =[[NSString alloc] initWithFormat:@"action=drop&crn=%@", [NSString stringWithFormat:@"%d", sender.tag]];
    int status = [HTTP postAndGetStatusCode:@"register" :post];
    
    if (status != 200) {
        [self alertStatus:@"An error occured when trying to drop a course." :@"Error!" :0];
    } else {
        [self alertStatus:[NSString stringWithFormat:@"crn: %d", sender.tag]: @"Successfully dropped!" :0];
    }
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
    cell = [tableData objectAtIndex:indexPath.row];
    return cell;
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

@end
