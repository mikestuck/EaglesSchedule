//
//  APIUtil.m
//  EaglesSchedule - ObjC
//
//  Created by Mike Stuck on 10/25/16.
//  Copyright © 2016 Mike Stuck. All rights reserved.
//

#import "APIUtil.h"

@implementation APIUtil

+ (NSMutableArray *)getPreSeasonSchedule{
    NSMutableArray *scheduleArray = [[NSMutableArray alloc] init];
    NSURL *URL = [NSURL URLWithString:API_MOCK_DATA_URL];
    NSData *data = [[NSData alloc] initWithContentsOfURL:URL];
    NSError *error = nil;
    NSDictionary *dictionary = [XMLReader dictionaryForXMLData:data error:&error];
    NSDictionary *listDictionary = dictionary[@"GameList"];
    NSDictionary *gameDictionary = listDictionary[@"GameSection"];
    NSArray *gameArray = [gameDictionary valueForKey:@"Game"];
    NSArray *preseason = gameArray.lastObject;
    for(int i = 0; i < preseason.count; i++){
        [scheduleArray addObject:[Game parseGameWithDictionary:[preseason objectAtIndex:i]]];
    }
    return scheduleArray;
}

+ (NSMutableArray *)getRegSeasonSchedule{
    NSMutableArray *scheduleArray = [[NSMutableArray alloc] init];
    NSURL *URL = [NSURL URLWithString:API_MOCK_DATA_URL];
    NSData *data = [[NSData alloc] initWithContentsOfURL:URL];
    NSError *error = nil;
    NSDictionary *dictionary = [XMLReader dictionaryForXMLData:data error:&error];
    NSDictionary *listDictionary = dictionary[@"GameList"];
    NSDictionary *gameDictionary = listDictionary[@"GameSection"];
    NSArray *gameArray = [gameDictionary valueForKey:@"Game"];
    NSArray *regseason = gameArray.firstObject;
    for(int i = 0; i < regseason.count; i++){
        [scheduleArray addObject:[Game parseGameWithDictionary:[regseason objectAtIndex:i]]];
    }
    return scheduleArray;
}

+ (Team *)getTeam{
    NSURL *URL = [NSURL URLWithString:API_MOCK_DATA_URL];
    NSData *data = [[NSData alloc] initWithContentsOfURL:URL];
    NSError *error = nil;
    NSDictionary *dictionary = [XMLReader dictionaryForXMLData:data error:&error];
    NSDictionary *listDictionary = dictionary[@"GameList"];
    NSDictionary *appTeam = listDictionary[@"Team"];
    return [Team parseTeamWithDictionary:appTeam];
}

+ (NSString *)getRegularSeasonHeader{
    NSURL *URL = [NSURL URLWithString:API_MOCK_DATA_URL];
    NSData *data = [[NSData alloc] initWithContentsOfURL:URL];
    NSError *error = nil;
    NSDictionary *dictionary = [XMLReader dictionaryForXMLData:data error:&error];
    NSDictionary *listDictionary = dictionary[@"GameList"];
    NSDictionary *gameDictionary = listDictionary[@"GameSection"];
    NSArray *headingArray = [gameDictionary valueForKey:@"Heading"];
    return [NSString stringWithFormat:@"%@", headingArray.firstObject];
}

+ (NSString *)getPreseasonHeader{
    NSURL *URL = [NSURL URLWithString:API_MOCK_DATA_URL];
    NSData *data = [[NSData alloc] initWithContentsOfURL:URL];
    NSError *error = nil;
    NSDictionary *dictionary = [XMLReader dictionaryForXMLData:data error:&error];
    NSDictionary *listDictionary = dictionary[@"GameList"];
    NSDictionary *gameDictionary = listDictionary[@"GameSection"];
    NSArray *headingArray = [gameDictionary valueForKey:@"Heading"];
    return [NSString stringWithFormat:@"%@", headingArray.lastObject];
}

+ (UIImage *)getTeamLogo{
    return nil;
}

@end
