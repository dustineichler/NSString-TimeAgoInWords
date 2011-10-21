//
//  NSString_TimeAgoInWordsTests.h
//  NSString+TimeAgoInWordsTests
//
//  Created by Dustin Eichler on 10/20/11.
//  Copyright (c) 2011 Freelance Consultant. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "NSString_TimeAgoInWords.h"

@interface NSString_TimeAgoInWordsTests : SenTestCase
{
    NSDateFormatter     *formatter;
    NSDate              *current;
    NSDateComponents    *components;
    NSCalendar          *gregorian;
    NSString            *currentDate;
    NSDate              *newCurrentDate;
}

@end
