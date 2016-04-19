//
//  XYCalendarViewController.m
//  XYCalendar
//
//  Created by  on 15/5/18.
//  Copyright (c) 2015年 强新宇. All rights reserved.
//

#import "XYCalendarCollectionReusableView.h"
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
@implementation XYCalendarCollectionReusableView


- (instancetype)initWithFrame:(CGRect)frame
{
    if ([super initWithFrame:frame]) {
        float y = 0;
        if (kScreenHeight > 568) {
            y = 20;
        }
        
        self.monthLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0 + y/2, frame.size.width, 20)];
        
        _monthLabel.textAlignment = NSTextAlignmentCenter;
        _monthLabel.textColor = [UIColor orangeColor];
        [self addSubview:_monthLabel];
        
        
        NSArray * array = @[@"日",
                            @"一",
                            @"二",
                            @"三",
                            @"四",
                            @"五",
                            @"六",
                            ];
        
        
        for (int i = 0 ; i < 7 ; i ++) {
            UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(10 + ((kScreenWidth - 20) / 7 + 1.5) * i, 25 + y, (kScreenWidth - 20) / 7 - 10, 20)];
            label.textAlignment = NSTextAlignmentCenter;
            label.textColor = [UIColor orangeColor];
            label.font = [UIFont systemFontOfSize:15.0/320 * kScreenWidth];
            label.text = array[i];
            [self addSubview:label];
        }
        
        
        
        UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 49 + y, kScreenWidth, 1)];
        view.backgroundColor = [UIColor blackColor];
        [self addSubview:view];
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
    
   
    
}

@end
