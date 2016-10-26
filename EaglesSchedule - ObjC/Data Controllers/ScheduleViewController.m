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
    [self getSchedule];
}

- (void)setupView{
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"SCHEDULE";
}

- (void)setupTableView{
    scheduleTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
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
    return [scheduleArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return LAYOUT_HEADER_HEIGHT;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
        return LAYOUT_CELL_HEIGHT;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ScheduleTableViewCell *cell = (ScheduleTableViewCell *)[scheduleTable dequeueReusableCellWithIdentifier:@"ScheduleCell"];
    if(cell == nil) {
        cell = [[ScheduleTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ScheduleCell"];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    Game *cellGame = [scheduleArray objectAtIndex:indexPath.row];
    cell.week.text = cellGame.week;
    cell.homeScore.text = cellGame.homeScore;
    cell.awayTeam.text = cellGame.opponent.name;
    cell.awayScore.text = cellGame.awayScore;
    cell.status.text = cellGame.gameState;
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    // No instruction on to handle cell selection
}

#pragma mark - UITableViewHeader

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
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
        headerTitle = @"REGULAR SEASON";
    }
    else{
        headerTitle = @"PRESEASON";
    }
    return headerTitle;
}

#pragma mark - GETS

- (void)getSchedule{
    scheduleArray = [APIUtil getSchedule];
    [scheduleTable reloadData];
}




@end
