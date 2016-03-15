//
//  QYCalendar.m
//  Rilidemo
//
//  Created by guoqingyang on 16/3/15.
//  Copyright © 2016年 guoqingyang. All rights reserved.
//

#import "QYCalendar.h"
#import "QYDataHandel.h"
#import "QYHleper.h"
#import "QYDateHelper.h"
#import "DateCell.h"
#import "HraderView.h"
#define kWidth self.frame.size.width
#define kHeight self.frame.size.height
@interface QYCalendar ()<UICollectionViewDelegate,UICollectionViewDataSource>
{
    UICollectionView *collectionview;
    NSInteger index;
    NSInteger nowYear;
    NSInteger nowMonth;
    NSInteger nowDay;
    NSMutableArray *dateArray;
}
@end

@implementation QYCalendar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [QYDataHandel shareData].width = self.frame.size.width;
        [QYDataHandel shareData].height = self.frame.size.height;
        [self drawCollectionView];
        [self getNowDate];
        [self getDays];
    }
    return self;
}
//collectionView
-(void)drawCollectionView{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = CGSizeMake(kWidth/7.0, kHeight/6.0);
    flowLayout.sectionInset = UIEdgeInsetsMake(0,0,0,0);
    flowLayout.minimumLineSpacing = 0;
    flowLayout.minimumInteritemSpacing  = 0;
    flowLayout.headerReferenceSize = CGSizeMake(kHeight/6.0, kHeight/6.0);
    collectionview = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, kWidth, kHeight) collectionViewLayout:flowLayout];
    collectionview.backgroundColor = [UIColor whiteColor];
    [collectionview registerClass:[DateCell class] forCellWithReuseIdentifier:@"cell"];
    [collectionview registerClass:[HraderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    collectionview.delegate = self;
    collectionview.dataSource = self;
    [self addSubview:collectionview];
}
-(void)getNowDate{
    nowYear = [QYDateHelper getCurrentYear];
    nowMonth =[QYDateHelper getCurrentMonth];
    nowDay = [QYDateHelper getCurrentDay];
}
-(void)getDays{
    dateArray = [NSMutableArray new];
    NSInteger days = [QYHleper DaysfromYear:nowYear andMonth:nowMonth];
    NSString *today = [QYHleper getWeekDay:(int)nowYear :(int)nowMonth :1];
    if ([today isEqualToString:@"周日"]) {
        index = 0;
    }else if ([today isEqualToString:@"周一"]){
        index = 1;
        NSString *str = @"";
        [dateArray addObject:str];
    }else if ([today isEqualToString:@"周二"]){
        index = 2;
        for (int i=0; i<2; i++) {
            NSString *str = @"";
            [dateArray addObject:str];
        }
    }else if ([today isEqualToString:@"周三"]){
        index = 3;
        for (int i=0; i<3; i++) {
            NSString *str = @"";
            [dateArray addObject:str];
        }
    }else if ([today isEqualToString:@"周四"]){
        index = 4;
        for (int i=0; i<4; i++) {
            NSString *str = @"";
            [dateArray addObject:str];
        }
    }else if ([today isEqualToString:@"周五"]){
        index = 5;
        for (int i=0; i<5; i++) {
            NSString *str = @"";
            [dateArray addObject:str];
        }
    }else if ([today isEqualToString:@"周六"]){
        index = 6;
        for (int i=0; i<6; i++) {
            NSString *str = @"";
            [dateArray addObject:str];
        }
    }
    for (int i=1; i<=days; i++) {
        NSString *str = [NSString stringWithFormat:@"%d",i];
        [dateArray addObject:str];
    }
    [collectionview reloadData];
}

#pragma mark-collection代理-
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return dateArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    DateCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.label.text = dateArray[indexPath.row];
    return cell;
}
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    HraderView *headerView =[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
    return headerView;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row>=index) {
        [self.delegate sendDate:[NSString stringWithFormat:@"%d-%d-%@",nowYear,nowMonth,dateArray[indexPath.row]]];
    }else{
        return;
    }
}

//下个月
-(void)nextMonth{
    nowMonth++;
    if (nowMonth==13) {
        nowMonth = 1;
        nowYear++;
    }
    [self.delegate sendMonth:[NSString stringWithFormat:@"%ld-%ld",(long)nowYear,(long)nowMonth]];
    [self getDays];
}
//上个月
-(void)lastMonth{
    nowMonth--;
    if (nowMonth<1) {
        nowMonth=12;
        nowYear--;
    }
    [self.delegate sendMonth:[NSString stringWithFormat:@"%ld-%ld",(long)nowYear,(long)nowMonth]];
    [self getDays];
}



@end
