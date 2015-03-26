//
//  ViewController.h
//  iPad
//
//  Created by Francis Manansala on 2015-03-04.
//  Copyright (c) 2015 Francis Manansala. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface ViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *txtUsername;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;
- (IBAction)loginClicked:(id)sender;

@end
