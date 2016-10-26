//
//  ScheduleTableViewCell.m
//  EaglesSchedule - ObjC
//
//  Created by Mike Stuck on 10/25/16.
//  Copyright © 2016 Mike Stuck. All rights reserved.
//

#import "ScheduleTableViewCell.h"

@implementation ScheduleTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.bye.hidden = true;
    }
    return self;
}

- (void)showByeWeek{
    self.bye.hidden = false;
    
    self.week.hidden = true;
    self.homeScore.hidden = true;
    self.homeTeam.hidden = true;
    self.homeLogo.hidden = true;
    self.awayTeam.hidden = true;
    self.awayScore.hidden = true;
    self.awayLogo.hidden = true;
    self.status.hidden = true;
}


@end
