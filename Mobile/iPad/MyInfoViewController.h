//
//  MyInfoViewController.h
//  iPad
//
//  Created by Francis Manansala on 2015-03-26.
//  Copyright (c) 2015 Francis Manansala. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyInfoViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *username;
@property (weak, nonatomic) IBOutlet UILabel *fullName;
@property (weak, nonatomic) IBOutlet UILabel *ID;
@property (weak, nonatomic) IBOutlet UILabel *email;
@property (weak, nonatomic) IBOutlet UILabel *degree;
@property (weak, nonatomic) IBOutlet UILabel *welcome;

@property (strong, nonatomic) NSDictionary *passedJsondata;
- (IBAction)clickedLogout:(id)sender;
- (IBAction)clickedMyCourses:(id)sender;
- (IBAction)clickedRegisterCourses:(id)sender;


@end
