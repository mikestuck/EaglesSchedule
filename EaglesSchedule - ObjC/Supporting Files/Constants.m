//
//  Constants.m
//  EaglesSchedule - ObjC
//
//  Created by Mike Stuck on 10/25/16.
//  Copyright © 2016 Mike Stuck. All rights reserved.
//

#import "Constants.h"

@implementation Constants

#pragma mark - Mixpanel Constants

NSString *const MIXPANEL_API_KEY = @"263328dff2ed7ed873984efdd0804e43";
NSString *const MIXPANEL_APP_OPEN = @"APP OPENED";
NSString *const MIXPANEL_APP_TERMINATED = @"APP TERMINATED";
NSString *const MIXPANEL_APP_BACKGROUND = @"APP IN BACKGROUND";
NSString *const MIXPANEL_APP_FOREGROUND = @"APP IN FOREGROUND";

#pragma mark - API Constants

NSString *const API_LOGO_BASE_URL = @"http://yc-­‐app-­‐resources.s3.amazonaws.com/nfl/logos/";
NSString *const API_MOCK_DATA_URL = @"http://files.yinzcam.com.s3.amazonaws.com/iOS/interviews/ScheduleExercise/schedule.xml";

#pragma mark - Font Constants

NSString *const FONT_LEAGUE_GOTHIC = @"LeagueGothic-Regular";
NSString *const FONT_MAVEN_PRO_BOLD = @"MavenProBold";
NSString *const FONT_MAVEN_PRO_REGULAR = @"MavenProRegular";

#pragma mark - Layout Constants

int LAYOUT_CELL_HEIGHT = 120;
int LAYOUT_HEADER_HEIGHT = 30;
int LAYOUT_X_PADDING = 10;

@end
