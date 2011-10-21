//
//  NSString_TimeAgoInWords.m
//  NSString+TimeAgoInWords
//
//  Created by Dustin Eichler on 10/20/11.
//  Copyright (c) 2011 Freelance Consultant. All rights reserved.
//

#import "NSString_TimeAgoInWords.h"

@implementation NSString (NSStringExtensions)

-(NSString *) timeAgoInWords
{
    NSString *timestamp = [[NSString alloc] initWithString:self];
    // The time interval - Year 
    NSTimeInterval theTimeInterval = 326.4;
    
    // Get the system calendar
    NSCalendar *sysCalendar = [NSCalendar currentCalendar];
    
    // Create the NSDates        
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss-07:00"];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"PST"]];
    
    NSDate *fromDate = [dateFormatter dateFromString:timestamp];
    
    // Time Now
    NSDate *currentDate = [[NSDate alloc] init];

    // Time Interval
    NSDate *toDate = [[NSDate alloc] initWithTimeInterval:theTimeInterval sinceDate:currentDate]; 
    
    // Get conversion to months, days, hours, minutes
    unsigned int unitFlags = NSHourCalendarUnit | NSMinuteCalendarUnit | NSDayCalendarUnit | NSMonthCalendarUnit;
    NSDateComponents *conversionInfo = [sysCalendar components:unitFlags fromDate:fromDate  toDate:toDate  options:0];
    NSString *result;

    while ([conversionInfo second] > 0)
    {
        NSLog(@"------------- TIMESTAMP: %@",
              [NSString stringWithFormat:@"%d months, %d day, %d hour, %d minutes", 
               [conversionInfo month],
               [conversionInfo day],
               [conversionInfo hour],
               [conversionInfo minute]]);
        
        if ([conversionInfo month] > 1 && [conversionInfo month] < 12) {
            result = [NSString stringWithFormat:@"%d months ago", [conversionInfo month]];
            break;
        } else if ([conversionInfo day] > 1 && [conversionInfo day] < 30 && [conversionInfo month] == 0 ){
            result = [NSString stringWithFormat:@"%d days ago", [conversionInfo day]];
            break;
        } else if ([conversionInfo hour] > 1 && [conversionInfo hour] < 24 && [conversionInfo day] == 0) {
            result = [NSString stringWithFormat:@"%d hours ago", [conversionInfo hour]];
            break;
        } else if ([conversionInfo minute] > 1 && [conversionInfo minute] < 60 && [conversionInfo hour] == 0) {
            result = [NSString stringWithFormat:@"%d minutes ago", [conversionInfo minute]];
            break;
        } else {
            result = [NSString stringWithFormat:@"now"];
            break; //Probably don't need a break statement here.
        }
        break;
    }
    
    return result;
}

@end
