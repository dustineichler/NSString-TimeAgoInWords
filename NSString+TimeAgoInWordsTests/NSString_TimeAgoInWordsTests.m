//
//  NSString_TimeAgoInWordsTests.m
//  NSString+TimeAgoInWordsTests
//
//  Created by Dustin Eichler on 10/20/11.
//  Copyright (c) 2011 Freelance Consultant. All rights reserved.
//

#import "NSString_TimeAgoInWordsTests.h"

static const int oneToAdd       = 1;
static const int twoToAdd       = 2;
static const int thirtyToAdd    = 30;

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
    NSLog(@"------------- currentDate %@", currentDate);
    
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
    NSLog(@"------------- todaysStringDate %@", todaysStringDate);
    NSLog(@"------------- currentDate %@", current);
    NSString *_now = [todaysStringDate timeAgoInWords];
    STAssertEqualObjects(_now, @"now", @"Failed: Timestamp does not match");
}

//- (void)testThirtySecondsfromNow
//{
//    [components setSecond:thirtyToAdd];
//    NSDate   *thirtySecondstoAddDate = [gregorian dateByAddingComponents:components toDate:current options:0];
//    NSString *thirtySecondsAgo = [formatter stringFromDate:thirtySecondstoAddDate];
//    NSString *_thirtySecondsAgo = [thirtySecondsAgo timeAgoInWords];
//    STAssertEqualObjects(_thirtySecondsAgo, @"Not Finished", @"Failed: Timestamp does not match");
//}

//- (void)testOneMinuteFromNow
//{
//    [components setMinute:oneToAdd];
//    NSDate   *oneMinutetoAddDate = [gregorian dateByAddingComponents:components toDate:current options:0];
//    NSString *oneMinuteAgo = [formatter stringFromDate:oneMinutetoAddDate];
//    NSString *_oneMinuteAgo = [oneMinuteAgo timeAgoInWords];
//    STAssertEqualObjects(_oneMinuteAgo, @"Not Finished", @"Failed: Timestamp does not match");
//}

//- (void)testTwoMinutesFromNow
//{
//    [components setMinute:twoToAdd];
//    NSDate   *twoMinutestoAddDate = [gregorian dateByAddingComponents:components toDate:current options:0];
//    NSString *twoMinutesAgo = [formatter stringFromDate:twoMinutestoAddDate];
//    NSString *_twoMinutesAgo = [twoMinutesAgo timeAgoInWords];
//    STAssertEqualObjects(_twoMinutesAgo, @"Not Finished", @"Failed: Timestamp does not match");
//}

//- (void)testOneHourFromNow
//{
//    [components setHour:oneToAdd];
//    NSDate   *oneHourtoAddDate = [gregorian dateByAddingComponents:components toDate:current options:0];
//    NSString *oneHourAgo = [formatter stringFromDate:oneHourtoAddDate];
//    NSString *_oneHourAgo = [oneHourAgo timeAgoInWords];
//    STAssertEqualObjects(_oneHourAgo, @"Not Finished", @"Failed: Timestamp does not match");
//}

//- (void)testTwoHoursFromNow
//{
//    [components setHour:twoToAdd];
//    NSDate   *twoHourstoAddDate = [gregorian dateByAddingComponents:components toDate:current options:0];
//    NSString *twoHoursAgo = [formatter stringFromDate:twoHourstoAddDate];
//    NSString *_twoHoursAgo = [twoHoursAgo timeAgoInWords];
//    STAssertEqualObjects(_twoHoursAgo, @"Not Finished", @"Failed: Timestamp does not match");
//}

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

//- (void)testOneMonthFromNow
//{
//    [components setMonth:oneToAdd];
//    NSDate   *oneMonthtoAddDate = [gregorian dateByAddingComponents:components toDate:current options:0];
//    NSString *oneMonthAgo = [formatter stringFromDate:oneMonthtoAddDate];
//    NSString *_oneMonthAgo = [oneMonthAgo timeAgoInWords];
//    STAssertEqualObjects(_oneMonthAgo, @"Not Finished", @"Failed: Timestamp does not match");  
//}

//- (void)testTwoMonthsFromNow
//{
//    [components setMonth:twoToAdd];
//    NSDate   *twoMonthstoAddDate = [gregorian dateByAddingComponents:components toDate:current options:0];
//    NSString *twoMonthsAgo = [formatter stringFromDate:twoMonthstoAddDate];
//    NSString *_twoMonthsAgo = [twoMonthsAgo timeAgoInWords];
//    STAssertEqualObjects(_twoMonthsAgo, @"Not Finished", @"Failed: Timestamp does not match");
//}

@end
