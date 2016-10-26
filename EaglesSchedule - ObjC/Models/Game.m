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
        Date *date = [Date parseDateWithDictionary:dateDict];
        game.date = date;
    }
    return game;
}

@end
