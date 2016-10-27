//
//  ScheduleTableViewCell.h
//  EaglesSchedule - ObjC
//
//  Created by Mike Stuck on 10/25/16.
//  Copyright © 2016 Mike Stuck. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Game.h"
#import "Constants.h"
#import "ColorUtil.h"
#import "UIImageView+AFNetworking.h"

@interface ScheduleTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *homeTeam;
@property (weak, nonatomic) IBOutlet UILabel *homeScore;
@property (weak, nonatomic) IBOutlet UIImageView *homeLogo;
@property (weak, nonatomic) IBOutlet UILabel *awayTeam;
@property (weak, nonatomic) IBOutlet UILabel *awayScore;
@property (weak, nonatomic) IBOutlet UIImageView *awayLogo;
@property (weak, nonatomic) IBOutlet UILabel *status;
@property (weak, nonatomic) IBOutlet UILabel *week;
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (weak, nonatomic) IBOutlet UILabel *ampersand;
@property (weak, nonatomic) IBOutlet UILabel *bye;

- (void)showByeWeek;
- (void)showGameWeek;
- (void)setupFinalGameWithObject:(Game *)game appTeam:(Team *)appTeam;
- (void)setupScheduledGameWithObject:(Game *)game appTeam:(Team *)appTeam;

@end
