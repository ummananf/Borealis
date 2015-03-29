//
//  ViewController.m
//  iPad
//
//  Created by Francis Manansala on 2015-03-04.
//  Copyright (c) 2015 Francis Manansala. All rights reserved.
//

#import "ViewController.h"
#import "SBJson.h"

#import "MyInfoViewController.h"

#import "UserInfo.h"



@interface ViewController ()

@end

@implementation ViewController
NSDictionary *user;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//This is the login code; currently not working properly
- (IBAction)loginClicked:(id)sender {
    NSInteger success = 0;
    @try {
        
        if([[self.txtUsername text] isEqualToString:@""] || [[self.txtPassword text] isEqualToString:@""] ) {
            
            [self alertStatus:@"Please enter Username and Password" :@"Login Failed!" :0];
            
        } else {
            NSString *post =[[NSString alloc] initWithFormat:@"username=%@&password=%@",[self.txtUsername text],[self.txtPassword text]];
            NSLog(@"PostData: %@",post);
            
            NSURL *url=[NSURL URLWithString:@"http://awstest-fa5gzzwmbd.elasticbeanstalk.com/login"];
            
            NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
            NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
            
            NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
            [request setURL:url];
            [request setHTTPMethod:@"POST"];
            [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
            [request setHTTPBody:postData];

            NSHTTPURLResponse *requestResponse;
            NSData *requestHandler = [NSURLConnection sendSynchronousRequest:request returningResponse:&requestResponse error:nil];
            
            NSString *requestReply = [[NSString alloc] initWithBytes:[requestHandler bytes] length:[requestHandler length] encoding:NSASCIIStringEncoding];
            NSLog(@"requestRply: %@", requestReply);

            // check status code of resonse. if 200 (OK response) -> success, otherwise failure.
            if ([requestResponse statusCode] == 200) {
                success = 1;
                
                SBJsonParser *jsonParser = [SBJsonParser new];
                NSDictionary *jsonData = (NSDictionary *) [jsonParser objectWithString:requestReply error:nil];
                NSLog(@"jsonData: %@",jsonData);
                user = jsonData;
                
                /*
                NSArray *key = [jsonData valueForKey:@"degName"];
                NSString *degree = [key objectAtIndex:0];
                NSLog(@"degName: %@", degree);
                
                key = [jsonData valueForKey:@"email"];
                NSString *email = [key objectAtIndex:0];
                NSLog(@"email: %@", email);
                
                key = [jsonData valueForKey:@"firstName"];
                NSString *firstName = [key objectAtIndex:0];
                NSLog(@"firstName: %@", firstName);
                
                key = [jsonData valueForKey:@"lastName"];
                NSString *lastName = [key objectAtIndex:0];
                NSLog(@"lastName: %@", lastName);
                
                key = [jsonData valueForKey:@"password"];
                NSString *password = [key objectAtIndex:0];
                NSLog(@"password: %@", password);
                
                key = [jsonData valueForKey:@"type"];
                NSString *type = [key objectAtIndex:0];
                NSLog(@"type: %@", type);
                
                key = [jsonData valueForKey:@"userID"];
                NSString *userID = [key objectAtIndex:0];
                NSLog(@"userID: %@", userID);
                
                key = [jsonData valueForKey:@"username"];
                NSString *username = [key objectAtIndex:0];
                NSLog(@"username: %@", username);
                */
                
                UserInfo *userInfo = [UserInfo getInstance];
                [userInfo parseDictionary:jsonData];
                
            }
        }
    }
    @catch (NSException * e) {
        NSLog(@"Exception: %@", e);
        [self alertStatus:@"Sign in Failed." :@"Error!" :0];
    }
    if (success) {
        [self performSegueWithIdentifier:@"login_success" sender:self];
    }
    else {
        [self alertStatus:@"Sign in Failed." :@"incorrrect username or password!" :0];
    }
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

- (BOOL) textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    [self loginClicked:nil];
    return YES;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    /*
    if([segue.identifier isEqualToString:@"login_success"]){
        UITabBarController *controller = (UITabBarController *)segue.destinationViewController;
        TabBarControllerDelegate *delegate = (TabBarControllerDelegate *) controller.delegate;
        delegate.jsondata = user;
    }
     */
     if([segue.identifier isEqualToString:@"login_success"]){
         MyInfoViewController *controller = [segue destinationViewController];
         [controller setPassedJsondata:user];
         
         //NSLog(@"testInt: %@", controller.passedJsondata);
     }
    
    
}

@end
