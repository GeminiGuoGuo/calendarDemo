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

#define kWidth  [[UIScreen mainScreen] bounds].size.width
#define kHeight  [[UIScreen mainScreen] bounds].size.height

@interface RootViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
{
    UICollectionView *collectionview;
}
@property(nonatomic,strong)NSMutableArray *dateArray;
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self collectionview];
    [self titleview];
    [self getDays];
}

-(void)titleview{
    NSDateFormatter *datefor = [[NSDateFormatter alloc]init];
    [datefor setDateFormat:@"yyyy-MM-dd"];
    NSDate *date = [NSDate date];
    NSString *time =[datefor stringFromDate:date];
    self.navigationItem.title = [time substringWithRange:NSMakeRange(0, 7)];
}
-(void)getDays{
    NSInteger days = [QYHleper DaysfromYear:[QYDateHelper getCurrentYear] andMonth:[QYDateHelper getCurrentMonth]];
    NSString *today = [QYHleper getWeekDay:(int)[QYDateHelper getCurrentYear] :(int)[QYDateHelper getCurrentMonth] :1];
    if ([today isEqualToString:@"周日"]) {
        
    }else if ([today isEqualToString:@"周一"]){
        NSString *str = @"";
        [self.dateArray addObject:str];
    }else if ([today isEqualToString:@"周二"]){
        for (int i=0; i<2; i++) {
            NSString *str = @"";
            [self.dateArray addObject:str];
        }
    }else if ([today isEqualToString:@"周三"]){
        for (int i=0; i<3; i++) {
            NSString *str = @"";
            [self.dateArray addObject:str];
        }
    }else if ([today isEqualToString:@"周四"]){
        for (int i=0; i<4; i++) {
            NSString *str = @"";
            [self.dateArray addObject:str];
        }
    }else if ([today isEqualToString:@"周五"]){
        for (int i=0; i<5; i++) {
            NSString *str = @"";
            [self.dateArray addObject:str];
        }
    }else if ([today isEqualToString:@"周六"]){
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

-(NSMutableArray*)dateArray{
    if (_dateArray==nil) {
        _dateArray = [NSMutableArray new];
    }
    return _dateArray;
}

@end
