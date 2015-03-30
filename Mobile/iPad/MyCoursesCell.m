//
//  MyCoursesCell.m
//  iPad
//
//  Created by Francis Manansala on 2015-03-29.
//  Copyright (c) 2015 Francis Manansala. All rights reserved.
//

#import "MyCoursesCell.h"

@implementation MyCoursesCell

@synthesize courseId;
@synthesize crn;
@synthesize section;
@synthesize days;
@synthesize startTime;
@synthesize courseName;
@synthesize creditHR;
@synthesize endTime;
@synthesize location;
@synthesize dropButton;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
<<<<<<< HEAD
        self.crn = [[UILabel alloc] initWithFrame:CGRectMake(-120, 10, 60, 30)];
        [self addSubview:self.crn];
        self.courseId = [[UILabel alloc] initWithFrame:CGRectMake(5, 10, 90, 30)];
        [self addSubview:self.courseId];
        self.section = [[UILabel alloc] initWithFrame:CGRectMake(100, 10, 60, 30)];
=======
        self.courseId = [[UILabel alloc] initWithFrame:CGRectMake(5, 10, 120, 30)];
        [self addSubview:self.courseId];
        self.crn = [[UILabel alloc] initWithFrame:CGRectMake(120, 10, 80, 30)];
        [self addSubview:self.crn];
        self.section = [[UILabel alloc] initWithFrame:CGRectMake(200, 10, 60, 30)];
>>>>>>> parent of a56c542... updated my courses view
        [self addSubview:self.section];
        self.courseName = [[UILabel alloc] initWithFrame:CGRectMake(165, 10, 265, 30)];
        [self addSubview:self.courseName];
        self.creditHR = [[UILabel alloc] initWithFrame:CGRectMake(430, 10, 60, 30)];
        [self addSubview:self.creditHR];
        self.days = [[UILabel alloc] initWithFrame:CGRectMake(490, 10, 60, 30)];
        [self addSubview:self.days];
        self.startTime = [[UILabel alloc] initWithFrame:CGRectMake(555, 10, 120, 30)];
        [self addSubview:self.startTime];
        self.endTime = [[UILabel alloc] initWithFrame:CGRectMake(680, 10, 120, 30)];
        [self addSubview:self.endTime];
        self.location = [[UILabel alloc] initWithFrame:CGRectMake(810, 10, 80, 30)];
        [self addSubview:self.location];
        self.dropButton = [[UIButton alloc] initWithFrame:CGRectMake(900, 10, 100, 30)];
        [self.dropButton setTitle:@"Drop" forState:0];
        [self addSubview:self.dropButton];
    }
    return self;
}

@end
