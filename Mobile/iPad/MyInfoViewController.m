//
//  MyInfoViewController.m
//  iPad
//
//  Created by Francis Manansala on 2015-03-26.
//  Copyright (c) 2015 Francis Manansala. All rights reserved.
//

#import "MyInfoViewController.h"

#import "ViewController.h"

#import "UserInfo.h"

@interface MyInfoViewController ()

@end

@implementation MyInfoViewController

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
    NSNumber *value = [NSNumber numberWithInt:UIInterfaceOrientationPortrait];
    [[UIDevice currentDevice] setValue:value forKey:@"orientation"];
    UserInfo *user = [UserInfo getInstance];
    
    self.welcome.text = [NSString stringWithFormat:@"Welcome back %@!", user.firstName];
    
    self.username.text = user.username;
    self.fullName.text = [NSString stringWithFormat:@"%@ %@", user.firstName, user.lastName];
    self.degree.text = user.degree;
    self.email.text = user.email;
    self.ID.text = user.ID;
    
     
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickedLogout:(id)sender {
    [self performSegueWithIdentifier:@"logout" sender:self];
}

- (IBAction)clickedMyCourses:(id)sender {
    [self performSegueWithIdentifier:@"myCourses" sender:self];
}

- (IBAction)clickedRegisterCourses:(id)sender {
    [self performSegueWithIdentifier:@"registerCourses" sender:self];
}

@end
