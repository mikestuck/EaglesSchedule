//
//  ScheduleTableViewCell.m
//  EaglesSchedule - ObjC
//
//  Created by Mike Stuck on 10/25/16.
//  Copyright © 2016 Mike Stuck. All rights reserved.
//

#import "ScheduleTableViewCell.h"

@implementation ScheduleTableViewCell

- (void)showByeWeek{
    self.bye.hidden = false;
    
    self.week.hidden = true;
    self.date.hidden= true;
    self.homeScore.hidden = true;
    self.homeTeam.hidden = true;
    self.homeLogo.hidden = true;
    self.awayTeam.hidden = true;
    self.awayScore.hidden = true;
    self.awayLogo.hidden = true;
    self.status.hidden = true;
    self.ampersand.hidden = true;
}

- (void)showGameWeek{
    self.bye.hidden = true;
    
    self.week.hidden = false;
    self.date.hidden= false;
    self.homeScore.hidden = false;
    self.homeTeam.hidden = false;
    self.homeLogo.hidden = false;
    self.awayTeam.hidden = false;
    self.awayScore.hidden = false;
    self.awayLogo.hidden = false;
    self.status.hidden = false;
    self.ampersand.hidden = false;
}



@end
