//
//  MasterViewController.h
//  Mobile
//
//  Created by Mark Grushevski on 2015-02-16.
//  Copyright (c) 2015 Team 8. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;

@end
