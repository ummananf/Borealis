//
//  RegisterViewController.h
//  iPad
//
//  Created by Mark Grushevski on 2015-03-29.
//  Copyright (c) 2015 Francis Manansala. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UISegmentedControl *termControl;
@property (weak, nonatomic) IBOutlet UISegmentedControl *categoryControl;
@property (weak, nonatomic) IBOutlet UITableView *courseTable;

- (IBAction)changedSegment:(id)sender;
- (IBAction)categoryChangedSegment:(id)sender;
- (IBAction)backClicked:(id)sender;

@end
