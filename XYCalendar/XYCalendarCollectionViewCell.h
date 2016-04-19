//
//  XYCalendarViewController.m
//  XYCalendar
//
//  Created by  on 15/5/18.
//  Copyright (c) 2015年 强新宇. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XYCalendarCollectionViewCell : UICollectionViewCell
@property (nonatomic,strong)UILabel * dayLabel;
@property (nonatomic,strong)UILabel * numberLabel;
@property (nonatomic,strong)UILabel * priceLabel;

- (void)setMonth:(NSString *)month day:(NSString *)day;
@property (nonatomic,strong)NSDictionary * myData;

@end
