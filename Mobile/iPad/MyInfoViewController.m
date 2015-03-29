//
//  MyInfoViewController.m
//  iPad
//
//  Created by Francis Manansala on 2015-03-26.
//  Copyright (c) 2015 Francis Manansala. All rights reserved.
//

#import "MyInfoViewController.h"

#import "ViewController.h"

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
	// Do any additional setup after loading the view.
    
    NSArray *key = [self.passedJsondata valueForKey:@"username"];
    NSString *username = [key objectAtIndex:0];
    self.username.text = username;
    
    key = [self.passedJsondata valueForKey:@"firstName"];
    NSString *firstName = [key objectAtIndex:0];
    
    self.welcome.text = [NSString stringWithFormat:@"Welcome back %@!", firstName];
    
    key = [self.passedJsondata valueForKey:@"lastName"];
    NSString *lastName = [key objectAtIndex:0];
    self.fullName.text = [NSString stringWithFormat:@"%@ %@", firstName, lastName];
    
    key = [self.passedJsondata valueForKey:@"degName"];
    NSString *degree = [key objectAtIndex:0];
    self.degree.text = degree;
    
    key = [self.passedJsondata valueForKey:@"email"];
    NSString *email = [key objectAtIndex:0];
    self.email.text = email;
    
    key = [self.passedJsondata valueForKey:@"userID"];
    NSString *ID = [key objectAtIndex:0];
    self.ID.text = [NSString stringWithFormat:@"%@", ID];
     
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
@end
