//
//  Game.m
//  EaglesSchedule - ObjC
//
//  Created by Mike Stuck on 10/25/16.
//  Copyright © 2016 Mike Stuck. All rights reserved.
//

#import "Game.h"

@implementation Game

+ (Game *)parseGameWithDictionary:(NSDictionary *) gameDictionary{
    Game *game = [[Game alloc] init];
    if(gameDictionary[@"AwayScore"]!= nil){
        game.awayScore = gameDictionary[@"AwayScore"];
    }
    if(gameDictionary[@"HomeScore"]!= nil){
        game.homeScore = gameDictionary[@"HomeScore"];
    }
    if(gameDictionary[@"Id"]!= nil){
        game.gameID = gameDictionary[@"Id"];
    }
    if(gameDictionary[@"Id"]!= nil){
        game.gameID = gameDictionary[@"Id"];
    }
    if(gameDictionary[@"Venue"]!= nil){
        game.venue = gameDictionary[@"Venue"];
    }
    if(gameDictionary[@"Week"]!= nil){
        game.week = gameDictionary[@"Week"];
    }
    if(gameDictionary[@"Opponent"]!= nil){
        NSDictionary *opponentDict = gameDictionary[@"Opponent"];
        Team *opponent = [Team parseTeamWithDictionary:opponentDict];
        game.opponent = opponent;
    }
    if(gameDictionary[@"Date"]!= nil){
        NSDictionary *dateDict = gameDictionary[@"Date"];
        Date *date = [Date parseDateWithNSDate:[TimeUtil convertToTimeZone:dateDict[@"Timestamp"]]];
        game.date = date;
    }
    if(gameDictionary[@"GameState"]!= nil){
        game.gameState = gameDictionary[@"GameState"];
    }
    if(gameDictionary[@"Type"]!= nil){
        game.type = gameDictionary[@"Type"];
    }
    if(gameDictionary[@"WLT"]!= nil){
        game.wlt = gameDictionary[@"WLT"];
    }
    if(gameDictionary[@"Home"]!= nil){
        if([gameDictionary[@"Home"] isEqualToString:@"false"]){
            game.isHome = false;
        }
        else{
            game.isHome = true;
        }
    }
    return game;
}

@end
