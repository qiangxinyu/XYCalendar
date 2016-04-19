//
//  XYCalendarViewController.m
//  XYCalendar
//
//  Created by  on 15/5/18.
//  Copyright (c) 2015年 强新宇. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XYCalendarViewController : UIViewController
/**
 *  一个月份创建一个 此控制器
 *
 *  @param nonatomic
 *  @param strong
 *
 *  @return
 */

/**
 *  输入 这个月的 日期  格式为   yyyy-MM
 */
@property (nonatomic,strong)NSString * monthDate;

@property (nonatomic,strong)NSArray * productArray;

@property (nonatomic,strong)NSDictionary * commidityDic;

@property (nonatomic,strong)NSString * taoCanID;

@end
