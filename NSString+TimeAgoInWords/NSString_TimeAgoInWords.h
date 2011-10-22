//
//  NSString_TimeAgoInWords.h
//  NSString+TimeAgoInWords
//
//  Created by Dustin Eichler on 10/20/11.
//  Copyright (c) 2011. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (NSStringExtensions)

-(NSString *) timeAgoInWords:(NSString *)timestamp withTemplate:(NSString *)temp;

@end
