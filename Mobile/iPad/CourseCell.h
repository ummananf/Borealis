//
//  CourseCell.h
//  iPad
//
//  Created by Mark Grushevski on 2015-03-29.
//  Copyright (c) 2015 Francis Manansala. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CourseCell : UITableViewCell

@property (nonatomic, strong) UILabel *courseId;
@property (nonatomic, strong) UILabel *crn;
@property (nonatomic, strong) UILabel *section;
@property (nonatomic, strong) UILabel *capacity;
@property (nonatomic, strong) UILabel *days;
@property (nonatomic, strong) UILabel *startTime;
@property (nonatomic, strong) UILabel *endTime;
@property (nonatomic, strong) UILabel *location;
@property (nonatomic, strong) UIButton *registerButton;
@property (nonatomic, strong) UIButton *dropButton;

@end
