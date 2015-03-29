//
//  CourseCell.m
//  iPad
//
//  Created by Mark Grushevski on 2015-03-29.
//  Copyright (c) 2015 Francis Manansala. All rights reserved.
//

#import "CourseCell.h"

@implementation CourseCell
@synthesize courseId;
@synthesize crn;
@synthesize section;
@synthesize capacity;
@synthesize days;
@synthesize startTime;
@synthesize endTime;
@synthesize location;
@synthesize registerButton;
@synthesize dropButton;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.courseId = [[UILabel alloc] initWithFrame:CGRectMake(5, 10, 100, 30)];
        [self addSubview:self.courseId];
        self.crn = [[UILabel alloc] initWithFrame:CGRectMake(100, 10, 100, 30)];
        [self addSubview:self.crn];
        self.section = [[UILabel alloc] initWithFrame:CGRectMake(200, 10, 100, 30)];
        [self addSubview:self.section];
        self.capacity = [[UILabel alloc] initWithFrame:CGRectMake(300, 10, 100, 30)];
        [self addSubview:self.capacity];
        self.days = [[UILabel alloc] initWithFrame:CGRectMake(400, 10, 100, 30)];
        [self addSubview:self.days];
        self.startTime = [[UILabel alloc] initWithFrame:CGRectMake(500, 10, 100, 30)];
        [self addSubview:self.startTime];
        self.endTime = [[UILabel alloc] initWithFrame:CGRectMake(600, 10, 100, 30)];
        [self addSubview:self.endTime];
        self.location = [[UILabel alloc] initWithFrame:CGRectMake(700, 10, 100, 30)];
        [self addSubview:self.location];
        self.registerButton = [[UIButton alloc] initWithFrame:CGRectMake(800, 10, 100, 30)];
        [self.registerButton setTitle:@"Register" forState:0];
        [self addSubview:self.registerButton];
        self.dropButton = [[UIButton alloc] initWithFrame:CGRectMake(900, 10, 100, 30)];
        [self.dropButton setTitle:@"Drop" forState:0];
        [self addSubview:self.dropButton];
    }
    return self;
}

@end
