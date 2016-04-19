//
//  XYCalendarViewController.m
//  XYCalendar
//
//  Created by  on 15/5/18.
//  Copyright (c) 2015年 强新宇. All rights reserved.
//

#import "XYCalendarCollectionViewCell.h"

@implementation XYCalendarCollectionViewCell


- (instancetype)initWithFrame:(CGRect)frame
{
    if ([super initWithFrame:frame]) {
        
        float height = 20.0/568 * kScreenHeight;
        
        self.dayLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, 30)];
        _dayLabel.textAlignment = NSTextAlignmentCenter;
        _dayLabel.center = CGPointMake(frame.size.width/2, frame.size.height/2);
        _dayLabel.font = [UIFont systemFontOfSize:16];
        [self addSubview:_dayLabel];
        
        self.numberLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, height, frame.size.width, 30)];
        _numberLabel.font = [UIFont systemFontOfSize:12];
        _numberLabel.textAlignment = NSTextAlignmentCenter;
        _numberLabel.numberOfLines = 0;
        [self addSubview:_numberLabel];
        
        int y = 7;
        if (kScreenWidth > 320) {
            y = 0;
        }
        
        self.priceLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, height * 2 + y, frame.size.width, 20)];
        _priceLabel.textAlignment = NSTextAlignmentCenter;
        _priceLabel.font = [UIFont systemFontOfSize:11];
        _priceLabel.textColor = [UIColor orangeColor];
        
        [self addSubview:_priceLabel];
        
        
    }
    return self;
}

- (void)setMonth:(NSString *)month day:(NSString *)day
{
    month = [NSString stringWithFormat:@"%ld",(long)month.integerValue];
   
    
    if ([month isEqualToString:@"1"] && [day isEqualToString:@"1"]){
        day = @"元旦";
    }
    if ([month isEqualToString:@"2"] && [day isEqualToString:@"14"]){
        day = @"情人节";
        
    }
    if ([month isEqualToString:@"3"] && [day isEqualToString:@"8"]){
        day = @"妇女节";
        
    }
    if ([month isEqualToString:@"3"] && [day isEqualToString:@"12"]){
        day = @"植树节";
        
    }
    if ([month isEqualToString:@"5"] && [day isEqualToString:@"1"]){
        day = @"劳动节";
        
    }
    if ([month isEqualToString:@"5"] && [day isEqualToString:@"4"]){
        day = @"青年节";
        
    }
    if ([month isEqualToString:@"6"] && [day isEqualToString:@"1"]){
        day = @"儿童节";
        
    }
    if ([month isEqualToString:@"7"] && [day isEqualToString:@"1"]){
        day = @"建党节";
        
    }
    if ([month isEqualToString:@"8"] && [day isEqualToString:@"1"]){
        day = @"建军节";
        
    }
    if ([month isEqualToString:@"9"] && [day isEqualToString:@"10"]){
        day = @"教师节";
        
    }
    if ([month isEqualToString:@"10"] && [day isEqualToString:@"1"]){
        day = @"国庆节";
        
    }
    
    self.dayLabel.text = day;
    self.dayLabel.textColor = [UIColor lightGrayColor];
    if (day.length >= 3) {
        self.dayLabel.font = [UIFont systemFontOfSize:12];
        self.dayLabel.numberOfLines = 2;
    }
}

- (void)setMyData:(NSDictionary *)myData
{
    _myData = myData;
    
    float y = 0;
    if (kScreenHeight > 568) {
        y = 10;
    }
    _dayLabel.center = CGPointMake(self.frame.size.width/2, 10 + y);
    _dayLabel.textColor = [UIColor blackColor];
    
    if (myData[@"inventory"]) {
        
        _numberLabel.text = [@"库存" stringByAppendingString:myData[@"inventory"]];
    }
    
    if (myData[@"adultprice"]) {
        _priceLabel.text = [@"¥" stringByAppendingString:myData[@"adultprice"]];
    }
    
}

- (void)awakeFromNib {
    // Initialization code
}

@end
