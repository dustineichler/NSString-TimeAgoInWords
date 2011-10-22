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
    
    // Get the system calendar
    NSCalendar *sysCalendar = [NSCalendar currentCalendar];
    
    // Create the NSDates        
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss-07:00"];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"PST"]];
    
    NSDate *fromDate = [dateFormatter dateFromString:timestamp];
    
    // Time Now
    NSDate *toDate = [[NSDate alloc] init];
    
    // Get conversion to months, days, hours, minutes
    unsigned int unitFlags = NSHourCalendarUnit | NSMinuteCalendarUnit | NSDayCalendarUnit | NSMonthCalendarUnit;
    NSDateComponents *conversionInfo = [sysCalendar components:unitFlags fromDate:fromDate  toDate:toDate  options:0];
    NSString *result;
    
#ifdef DEBUG
    NSLog(@"%@", [NSString stringWithFormat:@"%d months, %d weeks, %d days, %d hours, %d minutes, %d seconds",
                  [conversionInfo month],
                  [conversionInfo week],
                  [conversionInfo day],
                  [conversionInfo hour],
                  [conversionInfo minute],
                  [conversionInfo second]]);
#endif
        
    if ([conversionInfo month] > 0 && [conversionInfo month] < 12) {
        return result = [NSString stringWithFormat:[conversionInfo month] == 1 ? 
                         @"%d month ago" : @"%d months ago", [conversionInfo month]];
        
    } else if ([conversionInfo day] > 0 && [conversionInfo day] < 30 && [conversionInfo month] == 0 ){
        return result = [NSString stringWithFormat: [conversionInfo day] == 1 ? 
                         @"%d day ago" : @"%d days ago", [conversionInfo day]];
        
    } else if ([conversionInfo hour] > 0 && [conversionInfo hour] < 24 && [conversionInfo day] == 0) {
        return result = [NSString stringWithFormat: [conversionInfo hour] == 1 ? 
                         @"%d hour ago" : @"%d hours ago", [conversionInfo hour]];
        
    } else if ([conversionInfo minute] > 0 && [conversionInfo minute] < 60 && [conversionInfo hour] == 0) {
        return result = [NSString stringWithFormat: [conversionInfo minute] == 1 ? 
                         @"%d minute ago" : @"%d minutes ago", [conversionInfo minute]];
        
    } else {
        return result = [NSString stringWithFormat:@"now"];
        
    }    
    return result;
}

@end
