//
//  XYCalendarViewController.m
//  XYCalendar
//
//  Created by  on 15/5/18.
//  Copyright (c) 2015年 强新宇. All rights reserved.
//

#import "XYCalendarViewController.h"
#import "XYCalendarCollectionReusableView.h"
#import "XYCalendarCollectionViewCell.h"
#import "NSDate+XYCalendarLogic.h"

#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kScreenWidth  [UIScreen mainScreen].bounds.size.width

@interface XYCalendarViewController () <UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong)UICollectionView * collectionView;
@property (nonatomic,strong)UICollectionViewFlowLayout * layout;
@property (nonatomic,strong)NSArray * groupArray;
@end

static NSString * XYCalendarViewControlCell = @"cell";
static NSString * XYCalendarViewControlHeader = @"header";
@implementation XYCalendarViewController

- (NSArray *)getMonthArrayWithDate:(NSString *)month
{
    
    NSDateFormatter * fonmatter = [[NSDateFormatter alloc]init];
    [fonmatter setDateFormat:@"yyyy-MM"];
    
    NSDate * data = [fonmatter dateFromString:month];
    
    NSUInteger week =  [data weeklyOrdinality];
    NSInteger days = [data numberOfDaysInCurrentMonth];
    
    
    NSMutableArray * monthArray = [NSMutableArray array];
    for (int i = 0 ; i < week - 1; i ++) {
        [monthArray addObject:@""];
    }
    
    for (int i = 0 ; i < days; i ++) {
        [monthArray addObject:[NSString stringWithFormat:@"%d",i + 1]];
    }
    
    return monthArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.layout = [[UICollectionViewFlowLayout alloc]init];

    
    
    self.collectionView = [[UICollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:self.layout];
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_collectionView];
    _collectionView.bounces = NO;
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    
    
    [self.collectionView registerClass:[XYCalendarCollectionViewCell class] forCellWithReuseIdentifier:XYCalendarViewControlCell];
  
    [self.collectionView registerClass:[XYCalendarCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:XYCalendarViewControlHeader];
}

- (void)setMonthDate:(NSString *)monthDate
{
 
    _monthDate = monthDate;
    
    self.groupArray = [self getMonthArrayWithDate:monthDate];
    
    NSMutableArray * array = [NSMutableArray array];
    
    for (NSString * dayStr in self.groupArray) {
        [array addObject:@{}];
        for (NSDictionary * dic in self.productArray) {
            NSString * day = [dic[@"takeoffdate"] componentsSeparatedByString:@"-"].lastObject;
            if ([dayStr isEqualToString:day]) {
                [array removeLastObject];
                [array addObject:dic];
            }
        }
        
    }
    
    self.productArray = array;
    
    [self.collectionView reloadData];
    
}

- (void)setProductArray:(NSArray *)productArray
{
    _productArray = productArray;
    
    
    
    
    
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    //#warning Incomplete method implementation -- Return the number of sections
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    //#warning Incomplete method implementation -- Return the number of items in the section
    return self.groupArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    XYCalendarCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:XYCalendarViewControlCell forIndexPath:indexPath];
    
    // Configure the cell
    cell.backgroundColor = [UIColor whiteColor];
    

    [cell setMonth:[self.monthDate componentsSeparatedByString:@"-"].lastObject
               day:self.groupArray[indexPath.row]];
  
    
    if ([self.productArray[indexPath.row] isEqualToDictionary:@{}]) {
        
        return cell;
    }
    cell.myData = self.productArray[indexPath.row];
    
    return cell;
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (kScreenHeight > 568) {
        
        return CGSizeMake((kScreenWidth - 20) / 7 - 10 , ((kScreenHeight - 64 - 49 - 70 ) / 6) - 10);
    }
    
    return CGSizeMake((kScreenWidth - 20) / 7 - 10 , ((kScreenHeight - 64 - 49 - 50 ) / 6));
}



- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if (kScreenHeight > 568) {
        
        return CGSizeMake(kScreenWidth, 70);
    }
    
    return CGSizeMake(kScreenWidth, 50);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 5, 0, 5);
}


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    
    XYCalendarCollectionReusableView * views = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:XYCalendarViewControlHeader forIndexPath:indexPath];
    
    views.monthLabel.text = [[self.monthDate stringByReplacingOccurrencesOfString:@"-" withString:@"年"] stringByAppendingString:@"月"];
    return views;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
