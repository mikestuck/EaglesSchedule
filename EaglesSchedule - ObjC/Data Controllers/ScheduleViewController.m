//
//  ScheduleViewController.m
//  EaglesSchedule - ObjC
//
//  Created by Mike Stuck on 10/25/16.
//  Copyright © 2016 Mike Stuck. All rights reserved.
//

#import "ScheduleViewController.h"

@interface ScheduleViewController ()

@end

@implementation ScheduleViewController

#pragma mark - Setup

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
    [self setupTableView];
    [self getTeam];
    [self getSchedule];
}

- (void)setupView{
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"SCHEDULE";
}

- (void)setupTableView{
    scheduleTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height-64)];
    scheduleTable.delegate = self;
    scheduleTable.dataSource = self;
    scheduleTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    [scheduleTable setShowsHorizontalScrollIndicator:NO];
    [scheduleTable setShowsVerticalScrollIndicator:YES];
    [self.view addSubview:scheduleTable];
    
    [scheduleTable registerNib:[UINib nibWithNibName:@"ScheduleCell" bundle:nil] forCellReuseIdentifier:@"ScheduleCell"];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section == 0){
        return [regSeasonSchedule count];
    }
    else{
        return [preSeasonSchedule count];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return LAYOUT_HEADER_HEIGHT;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
        return LAYOUT_CELL_HEIGHT;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ScheduleTableViewCell *cell = (ScheduleTableViewCell *)[scheduleTable dequeueReusableCellWithIdentifier:@"ScheduleCell"];
    if(cell == nil) {
        cell = [[ScheduleTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ScheduleCell"];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    Game *cellGame = [self returnCorrectObject:indexPath];
    if([cellGame.type isEqualToString:GAME_TYPE_B]){
        [cell showByeWeek];
    }
    else if ([cellGame.type isEqualToString:GAME_TYPE_F]){
        [cell setupFinalGameWithObject:cellGame appTeam:appTeam];
        [cell showGameWeek];
    }
    else{
        [cell setupScheduledGameWithObject:cellGame appTeam:appTeam];
        [cell showGameWeek];
    }
    cell.week.text = cellGame.week;
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    // No instruction on to handle cell selection
}

#pragma mark - UITableViewHeader

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UILabel *headerLabel = [[UILabel alloc] init];
    headerLabel.frame = CGRectMake(0, 7, self.view.bounds.size.width, 14);
    headerLabel.font = [UIFont fontWithName:FONT_MAVEN_PRO_BOLD size:14];
    headerLabel.textColor = [ColorUtil lightTextColor];
    headerLabel.textAlignment = NSTextAlignmentCenter;
    headerLabel.text = [self tableView:tableView titleForHeaderInSection:section];
    
    UIView *headerView = [[UIView alloc] init];
    headerView.backgroundColor = [ColorUtil headerColor];
    [headerView addSubview:headerLabel];
    
    return headerView;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSString *headerTitle;
    if(section == 0){
        headerTitle = [APIUtil getRegularSeasonHeader];
    }
    else{
        headerTitle = [APIUtil getPreseasonHeader];
    }
    return headerTitle;
}

#pragma mark - Getters

/**
 Sets arrays with preseason and regular season game objects
 */

- (void)getSchedule{
    regSeasonSchedule = [APIUtil getRegSeasonSchedule];
    preSeasonSchedule = [APIUtil getPreSeasonSchedule];
    [scheduleTable reloadData];
}

/**
 Sets the appTeam to the team the schedule response is for
 */

- (void)getTeam{
    appTeam = [APIUtil getTeam];
}

#pragma mark - Helpers

/**
 Gets the correct game object from arrays based on indexPath section

 @param indexPath passed in indexPath

 @return Game object
 */

- (Game *)returnCorrectObject:(NSIndexPath *)indexPath{
    Game *cellGame;
    if(indexPath.section == 0){
        cellGame = [regSeasonSchedule objectAtIndex:indexPath.row];
    }
    else{
        cellGame = [preSeasonSchedule objectAtIndex:indexPath.row];
    }
    return cellGame;
}

@end
