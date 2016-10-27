//
//  ScheduleTableViewCell.m
//  EaglesSchedule - ObjC
//
//  Created by Mike Stuck on 10/25/16.
//  Copyright © 2016 Mike Stuck. All rights reserved.
//

#import "ScheduleTableViewCell.h"

@implementation ScheduleTableViewCell

/**
 UI alterations for "BYE" week
 */

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

/**
 UI alterations for "Scheduled" of "Final" week
 */

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

/**
 Sets up cell for a game with type "Final"

 @param game    passed in game object
 @param appTeam team object for application team
 */

- (void)setupFinalGameWithObject:(Game *)game appTeam:(Team *)appTeam{
    self.homeScore.font = [UIFont fontWithName:FONT_LEAGUE_GOTHIC size:30.0f];
    self.awayScore.font = [UIFont fontWithName:FONT_LEAGUE_GOTHIC size:30.0f];
    self.homeScore.textColor = [ColorUtil darkTextColor];
    self.awayScore.textColor = [ColorUtil darkTextColor];
    self.status.text = game.gameState;
    self.date.text = game.date.text;
    if(game.isHome){
        self.homeTeam.text = appTeam.name;
        self.awayTeam.text = game.opponent.name;
        [self setupLogoAsHomeTeamWithObject:game appTeam:appTeam];
    }
    else{
        self.homeTeam.text = game.opponent.name;
        self.awayTeam.text = appTeam.name;
        [self setupLogoAsAwayTeamWithObject:game appTeam:appTeam];
    }
    self.homeScore.text = game.homeScore;
    self.awayScore.text = game.awayScore;
}

/**
 Sets up cell for a game with type "Scheduled"

 @param game    passed in game object
 @param appTeam team object for application team
 */

- (void)setupScheduledGameWithObject:(Game *)game appTeam:(Team *)appTeam{
    self.homeScore.font = [UIFont fontWithName:FONT_MAVEN_PRO_BOLD size:14.0f];
    self.awayScore.font = [UIFont fontWithName:FONT_MAVEN_PRO_BOLD size:14.0f];
    self.homeScore.textColor = [ColorUtil lightTextColor];
    self.awayScore.textColor = [ColorUtil lightTextColor];
    self.status.text = game.date.time;
    self.date.text = game.date.text;
    if(game.isHome){
        self.homeTeam.text = appTeam.name;
        self.homeScore.text = appTeam.record;
        self.awayTeam.text = game.opponent.name;
        self.awayScore.text = game.opponent.record;
        [self setupLogoAsHomeTeamWithObject:game appTeam:appTeam];
    }
    else{
        self.homeTeam.text = game.opponent.name;
        self.homeScore.text = game.opponent.record;
        self.awayTeam.text = appTeam.name;
        self.awayScore.text = appTeam.record;
        [self setupLogoAsAwayTeamWithObject:game appTeam:appTeam];
        
    }
}

/**
 Handler for logo as home team

 @param game    passed in game object
 @param appTeam team object for application team
 */

- (void)setupLogoAsHomeTeamWithObject:(Game *)game appTeam:(Team *)appTeam{
    NSURLRequest *homeLogoRequest = [[NSURLRequest alloc]initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@nfl_%@_light.png", API_LOGO_BASE_URL, appTeam.triCode]]];
    [self.homeLogo setImageWithURLRequest:homeLogoRequest placeholderImage:nil success:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, UIImage * _Nonnull image) {
        self.homeLogo.image = image;
    } failure:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, NSError * _Nonnull error) {
        
    }];
    
    NSURLRequest *awayLogoRequest = [[NSURLRequest alloc]initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@nfl_%@_light.png", API_LOGO_BASE_URL, game.opponent.triCode]]];
    [self.awayLogo setImageWithURLRequest:awayLogoRequest placeholderImage:nil success:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, UIImage * _Nonnull image) {
        self.awayLogo.image = image;
    } failure:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, NSError * _Nonnull error) {
        
    }];
    
}

/**
 Handler for logo as away team

 @param game    passed in game object
 @param appTeam team object for application team
 */

- (void)setupLogoAsAwayTeamWithObject:(Game *)game appTeam:(Team *)appTeam{
    NSURLRequest *homeLogoRequest = [[NSURLRequest alloc]initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@nfl_%@_light.png", API_LOGO_BASE_URL, appTeam.triCode]]];
    [self.awayLogo setImageWithURLRequest:homeLogoRequest placeholderImage:nil success:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, UIImage * _Nonnull image) {
        self.awayLogo.image = image;
    } failure:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, NSError * _Nonnull error) {
        
    }];
    
    NSURLRequest *awayLogoRequest = [[NSURLRequest alloc]initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@nfl_%@_light.png", API_LOGO_BASE_URL, game.opponent.triCode]]];
    [self.homeLogo setImageWithURLRequest:awayLogoRequest placeholderImage:nil success:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, UIImage * _Nonnull image) {
        self.homeLogo.image = image;
    } failure:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, NSError * _Nonnull error) {
        
    }];
}

@end
