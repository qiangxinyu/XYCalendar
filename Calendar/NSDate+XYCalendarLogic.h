//
//  XYCalendarViewController.m
//  XYCalendar
//
//  Created by  on 15/5/18.
//  Copyright (c) 2015年 强新宇. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (XYCalendarLogic)
/**
 *  这个月有多少天
 *
 *  @return 
 */
- (NSUInteger)numberOfDaysInCurrentMonth;
- (NSDate *)firstDayOfCurrentMonth;
/**
 *  这个月的第一天星期几
 */
- (NSUInteger)weeklyOrdinality;
@end
