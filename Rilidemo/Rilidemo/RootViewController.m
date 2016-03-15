//
//  RootViewController.m
//  Rilidemo
//
//  Created by guoqingyang on 16/3/9.
//  Copyright © 2016年 guoqingyang. All rights reserved.
//

#import "RootViewController.h"
#import "CollectionViewCell.h"
#import "Header.h"
#import "QYHleper.h"
#import "QYDateHelper.h"


#import "QYCalendar.h"

#define kWidth  [[UIScreen mainScreen] bounds].size.width
#define kHeight  [[UIScreen mainScreen] bounds].size.height

@interface RootViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,QYCalendarDelegate>
{
    UICollectionView *collectionview;
    NSInteger index;
    NSInteger nowYear;
    NSInteger nowMonth;
    NSInteger nowDay;
    
    QYCalendar *view;
}
@property(nonatomic,strong)NSMutableArray *dateArray;
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self drawNav];
//    [self collectionview];
    [self getNowDate];
//    [self titleview];
//    [self getDays];
    
    view = [[QYCalendar alloc]initWithFrame:CGRectMake(30, 0, kWidth-60, 200)];
    [self.view addSubview:view];
    view.delegate = self;
    self.navigationItem.title = [NSString stringWithFormat:@"%ld-%ld",(long)nowYear,(long)nowMonth];
    
}
-(void)sendMonth:(NSString *)month{
    self.navigationItem.title = month;
}

-(void)sendDate:(NSString *)date{
    NSLog(@"%@",date);
}

-(void)drawNav{
    self.navigationController.navigationBar.translucent = NO;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"上一月" style:UIBarButtonItemStyleDone target:self action:@selector(leftbtn)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"下一月" style:UIBarButtonItemStyleDone target:self action:@selector(rightbtn)];
}
//左按钮
-(void)leftbtn{
//    nowMonth--;
//    if (nowMonth<1) {
//        nowMonth=12;
//        nowYear--;
//    }
//    [self getDays];
//    [self titleview];
    [view lastMonth];
}
//右按钮
-(void)rightbtn{
//    nowMonth++;
//    if (nowMonth==13) {
//        nowMonth = 1;
//        nowYear++;
//    }
//    [self getDays];
//    [self titleview];
    [view nextMonth];
}
-(void)titleview{
//    NSDateFormatter *datefor = [[NSDateFormatter alloc]init];
//    [datefor setDateFormat:@"yyyy-MM-dd"];
//    NSDate *date = [NSDate date];
//    NSString *time =[datefor stringFromDate:date];
//    self.navigationItem.title = [time substringWithRange:NSMakeRange(0, 7)];
    self.navigationItem.title = [NSString stringWithFormat:@"%ld-%ld",(long)nowYear,(long)nowMonth];
}
-(void)getNowDate{
    nowYear = [QYDateHelper getCurrentYear];
    nowMonth =[QYDateHelper getCurrentMonth];
    nowDay = [QYDateHelper getCurrentDay];
}
-(void)getDays{
    self.dateArray = [NSMutableArray new];
    NSInteger days = [QYHleper DaysfromYear:nowYear andMonth:nowMonth];
    NSString *today = [QYHleper getWeekDay:(int)nowYear :(int)nowMonth :1];
    if ([today isEqualToString:@"周日"]) {
        index = 0;
    }else if ([today isEqualToString:@"周一"]){
        index = 1;
        NSString *str = @"";
        [self.dateArray addObject:str];
    }else if ([today isEqualToString:@"周二"]){
        index = 2;
        for (int i=0; i<2; i++) {
            NSString *str = @"";
            [self.dateArray addObject:str];
        }
    }else if ([today isEqualToString:@"周三"]){
        index = 3;
        for (int i=0; i<3; i++) {
            NSString *str = @"";
            [self.dateArray addObject:str];
        }
    }else if ([today isEqualToString:@"周四"]){
        index = 4;
        for (int i=0; i<4; i++) {
            NSString *str = @"";
            [self.dateArray addObject:str];
        }
    }else if ([today isEqualToString:@"周五"]){
        index = 5;
        for (int i=0; i<5; i++) {
            NSString *str = @"";
            [self.dateArray addObject:str];
        }
    }else if ([today isEqualToString:@"周六"]){
        index = 6;
        for (int i=0; i<6; i++) {
            NSString *str = @"";
            [self.dateArray addObject:str];
        }
    }
    for (int i=1; i<=days; i++) {
        NSString *str = [NSString stringWithFormat:@"%d",i];
        [self.dateArray addObject:str];
    }
    [collectionview reloadData];
}

-(void)collectionview{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = CGSizeMake(kWidth/7.0, kWidth/7.0);
    flowLayout.sectionInset = UIEdgeInsetsMake(0,0,0,0);
    flowLayout.minimumLineSpacing = 0;
    flowLayout.minimumInteritemSpacing  = 0;
    flowLayout.headerReferenceSize = CGSizeMake(50, 50);
    collectionview = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0,kWidth, kHeight) collectionViewLayout:flowLayout];
    collectionview.backgroundColor = [UIColor whiteColor];
    [collectionview registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [collectionview registerClass:[Header class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    collectionview.delegate = self;
    collectionview.dataSource = self;
    [self.view addSubview:collectionview];
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dateArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.label.text = self.dateArray[indexPath.row];
    return cell;
}
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    Header *headerView =[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
    return headerView;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row>=index) {
       // NSLog(@"%@",self.dateArray[indexPath.row]);
    }else{
        return;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
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
