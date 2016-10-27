//
//  Team.m
//  EaglesSchedule - ObjC
//
//  Created by Mike Stuck on 10/25/16.
//  Copyright © 2016 Mike Stuck. All rights reserved.
//

#import "Team.h"

@implementation Team

+ (Team *)parseTeamWithDictionary:(NSDictionary *) teamDictionary{
    Team *team = [[Team alloc] init];
    if(teamDictionary[@"FullName"]!= nil){
        team.fullName = teamDictionary[@"FullName"];
    }
    if(teamDictionary[@"Name"]!= nil){
        team.name = teamDictionary[@"Name"];
    }
    if(teamDictionary[@"TriCode"]!= nil){
        team.triCode = [teamDictionary[@"TriCode"] lowercaseString];
    }
    if(teamDictionary[@"City"]!= nil){
        team.city = teamDictionary[@"City"];
    }
    if(teamDictionary[@"Record"]!= nil){
        team.record = teamDictionary[@"Record"];
    }
    return team;
}

@end
