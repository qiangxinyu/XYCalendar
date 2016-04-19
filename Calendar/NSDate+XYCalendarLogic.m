//
//  XYCalendarViewController.m
//  XYCalendar
//
//  Created by  on 15/5/18.
//  Copyright (c) 2015年 强新宇. All rights reserved.
//

#import "NSDate+XYCalendarLogic.h"

@implementation NSDate (XYCalendarLogic)
- (NSUInteger)numberOfDaysInCurrentMonth
{
    // 频繁调用 [NSCalendar currentCalendar] 可能存在性能问题
    return [[NSCalendar currentCalendar] rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:self].length;
}
- (NSDate *)firstDayOfCurrentMonth
{
    NSDate *startDate = nil;
    BOOL ok = [[NSCalendar currentCalendar] rangeOfUnit:NSMonthCalendarUnit startDate:&startDate interval:NULL forDate:self];
    NSAssert1(ok, @"Failed to calculate the first day of the month based on %@", self);
    
    NSTimeZone * timeZone = [NSTimeZone systemTimeZone];
    NSTimeInterval time = [timeZone secondsFromGMTForDate:startDate];
    
    
    
    return [startDate dateByAddingTimeInterval:time];
}

- (NSUInteger)weeklyOrdinality
{
    return [[NSCalendar currentCalendar] ordinalityOfUnit:NSDayCalendarUnit inUnit:NSWeekCalendarUnit forDate:self];
    return [[NSCalendar currentCalendar] ordinalityOfUnit:NSDayCalendarUnit inUnit:NSWeekCalendarUnit forDate:self];
}
@end
