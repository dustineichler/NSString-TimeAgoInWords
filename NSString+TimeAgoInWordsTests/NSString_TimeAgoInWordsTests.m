//
//  NSString_TimeAgoInWordsTests.m
//  NSString+TimeAgoInWordsTests
//
//  Created by Dustin Eichler on 10/20/11.
//  Copyright (c) 2011 Freelance Consultant. All rights reserved.
//

#import "NSString_TimeAgoInWordsTests.h"

static const int oneToAdd       = -1;
static const int twoToAdd       = -2;
static const int thirtyToAdd    = -30;

@implementation NSString_TimeAgoInWordsTests

- (void)setUp
{
    [super setUp];
    // Set-up code here.
    
    // Date Format
    formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss-07:00"];

    // Current Date
    current = [NSDate date];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss-07:00"];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"PST"]];
    
    currentDate = [dateFormatter stringFromDate:current];
    newCurrentDate = [dateFormatter dateFromString:currentDate];
    
    components = [[[NSDateComponents alloc] init] autorelease];
    gregorian = [[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar] autorelease];
}

- (void)tearDown
{
    // Tear-down code here.
    [formatter release];

    [super tearDown];
}

- (void)testTodaysDate
{    
    NSDate   *todaysDate = [gregorian dateByAddingComponents:components toDate:newCurrentDate options:0];
    NSString *todaysStringDate = [formatter stringFromDate:todaysDate];
    NSString *_now = [[NSString alloc] timeAgoInWords:todaysStringDate 
                                         withTemplate:@"yyyy-MM-dd'T'HH:mm:ss-07:00"];
    STAssertEqualObjects(_now, @"now", @"Failed: Timestamp does not match");
}

- (void)testThirtySecondsfromNow
{
    [components setSecond:thirtyToAdd];
    NSDate   *thirtySecondstoAddDate = [gregorian dateByAddingComponents:components toDate:current options:0];
    NSString *thirtySecondsAgo = [formatter stringFromDate:thirtySecondstoAddDate];
    NSString *_thirtySecondsAgo = [[NSString alloc] timeAgoInWords:thirtySecondsAgo 
                                                      withTemplate:@"yyyy-MM-dd'T'HH:mm:ss-07:00"];
    STAssertEqualObjects(_thirtySecondsAgo, @"now", @"Failed: Timestamp does not match");
}

- (void)testOneMinuteFromNow
{
    [components setMinute:oneToAdd];
    NSDate   *oneMinutetoAddDate = [gregorian dateByAddingComponents:components toDate:current options:0];
    NSString *oneMinuteAgo = [formatter stringFromDate:oneMinutetoAddDate];
    NSString *_oneMinuteAgo = [[NSString alloc] timeAgoInWords:oneMinuteAgo 
                                                  withTemplate:@"yyyy-MM-dd'T'HH:mm:ss-07:00"];
    STAssertEqualObjects(_oneMinuteAgo, @"1 minute ago", @"Failed: Timestamp does not match");
}

- (void)testTwoMinutesFromNow
{
    [components setMinute:twoToAdd];
    NSDate   *twoMinutestoAddDate = [gregorian dateByAddingComponents:components toDate:current options:0];
    NSString *twoMinutesAgo = [formatter stringFromDate:twoMinutestoAddDate];
    NSString *_twoMinutesAgo = [[NSString alloc] timeAgoInWords:twoMinutesAgo 
                                                   withTemplate:@"yyyy-MM-dd'T'HH:mm:ss-07:00"];
    STAssertEqualObjects(_twoMinutesAgo, @"2 minutes ago", @"Failed: Timestamp does not match");
}

- (void)testOneHourFromNow
{
    [components setHour:oneToAdd];
    NSDate   *oneHourtoAddDate = [gregorian dateByAddingComponents:components toDate:current options:0];
    NSString *oneHourAgo = [formatter stringFromDate:oneHourtoAddDate];
    NSString *_oneHourAgo = [[NSString alloc] timeAgoInWords:oneHourAgo 
                                                withTemplate:@"yyyy-MM-dd'T'HH:mm:ss-07:00"];
    STAssertEqualObjects(_oneHourAgo, @"1 hour ago", @"Failed: Timestamp does not match");
}

- (void)testTwoHoursFromNow
{
    [components setHour:twoToAdd];
    NSDate   *twoHourstoAddDate = [gregorian dateByAddingComponents:components toDate:current options:0];
    NSString *twoHoursAgo = [formatter stringFromDate:twoHourstoAddDate];
    NSString *_twoHoursAgo = [[NSString alloc] timeAgoInWords:twoHoursAgo 
                                                 withTemplate:@"yyyy-MM-dd'T'HH:mm:ss-07:00"];
    STAssertEqualObjects(_twoHoursAgo, @"2 hours ago", @"Failed: Timestamp does not match");
}

- (void)testOneDayFromNow
{
    [components setDay:oneToAdd];
    NSDate   *oneDaytoAddDate = [gregorian dateByAddingComponents:components toDate:current options:0];
    NSString *oneDayAgo = [formatter stringFromDate:oneDaytoAddDate];
    NSString *_oneDayAgo = [[NSString alloc] timeAgoInWords:oneDayAgo 
                                               withTemplate:@"yyyy-MM-dd'T'HH:mm:ss-07:00"];
    STAssertEqualObjects(_oneDayAgo, @"1 day ago", @"Failed: Timestamp does not match");
}

- (void)testTwoDaysFromNow
{
    [components setDay:twoToAdd];
    NSDate   *twoDaystoAddDate = [gregorian dateByAddingComponents:components toDate:current options:0];
    NSString *twoDaysAgo = [formatter stringFromDate:twoDaystoAddDate];
    NSString *_twoDaysAgo = [[NSString alloc] timeAgoInWords:twoDaysAgo 
                                                withTemplate:@"yyyy-MM-dd'T'HH:mm:ss-07:00"];
    STAssertEqualObjects(_twoDaysAgo, @"2 days ago", @"Failed: Timestamp does not match");
}

// TODO: DWE: Not Yet Implemented

//- (void)testOneWeekFromNow
//{
//    [components setWeek:oneToAdd];
//    NSDate   *oneWeektoAddDate = [gregorian dateByAddingComponents:components toDate:current options:0];
//    NSString *oneWeekAgo = [formatter stringFromDate:oneWeektoAddDate];
//    NSString *_oneWeekAgo = [oneWeekAgo timeAgoInWords];
//    STAssertEqualObjects(_oneWeekAgo, @"Not Finished", @"Failed: Timestamp does not match");
//}

//- (void)testTwoWeeksFromNow
//{
//    [components setWeek:twoToAdd];
//    NSDate   *twoWeekstoAddDate = [gregorian dateByAddingComponents:components toDate:current options:0];
//    NSString *twoWeeksAgo = [formatter stringFromDate:twoWeekstoAddDate];
//    NSString *_twoWeeksAgo = [twoWeeksAgo timeAgoInWords];
//    STAssertEqualObjects(_twoWeeksAgo, @"Not Finished", @"Failed: Timestamp does not match");
//}

- (void)testOneMonthFromNow
{
    [components setMonth:oneToAdd];
    NSDate   *oneMonthtoAddDate = [gregorian dateByAddingComponents:components toDate:current options:0];
    NSString *oneMonthAgo = [formatter stringFromDate:oneMonthtoAddDate];
    NSString *_oneMonthAgo = [[NSString alloc] timeAgoInWords:oneMonthAgo 
                                                 withTemplate:@"yyyy-MM-dd'T'HH:mm:ss-07:00"];
    STAssertEqualObjects(_oneMonthAgo, @"1 month ago", @"Failed: Timestamp does not match");  
}

- (void)testTwoMonthsFromNow
{
    [components setMonth:twoToAdd];
    NSDate   *twoMonthstoAddDate = [gregorian dateByAddingComponents:components toDate:current options:0];
    NSString *twoMonthsAgo = [formatter stringFromDate:twoMonthstoAddDate];
    NSString *_twoMonthsAgo = [[NSString alloc] timeAgoInWords:twoMonthsAgo 
                                                  withTemplate:@"yyyy-MM-dd'T'HH:mm:ss-07:00"];
    STAssertEqualObjects(_twoMonthsAgo, @"2 months ago", @"Failed: Timestamp does not match");
}

@end
