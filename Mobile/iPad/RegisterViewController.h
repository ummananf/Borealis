//
//  RegisterViewController.h
//  iPad
//
//  Created by Mark Grushevski on 2015-03-29.
//  Copyright (c) 2015 Francis Manansala. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISegmentedControl *termControl;
@property (weak, nonatomic) IBOutlet UISegmentedControl *categoryControl;
- (IBAction)changedSegment:(id)sender;
- (IBAction)categoryChangedSegment:(id)sender;

@end
