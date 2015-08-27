//
//  TableViewDelegate.m
//  YWeather
//
//  Created by mickey on 15/8/15.
//  Copyright (c) 2015年 mickey. All rights reserved.
//

#import "TableViewDelegate.h"
#import "CardCell.h"
#import "WeatherDataSourceModel.h"
#import "FooterView.h"
#import "SavaData.h"

static NSString * const cellID = @"CARDCELL";
static NSString * const footerID = @"FOOTERCELL";
static NSString * const bufferCardDataKey = @"bufferCardDataKey";
@interface TableViewDelegate()
{
    NSArray *datas;
}
@end
@implementation TableViewDelegate
-(void)awakeFromNib
{
    _cellTempUnits = CardTempUnits_C;
    datas = [SavaData getOldDataWithKey:bufferCardDataKey];
}
-(void)setCellTempUnits:(CardTempUnits)cellTempUnits
{
    _cellTempUnits = cellTempUnits;
    [_tableView reloadData];
}
-(void)setTableView:(UITableView *)tableView
{
    _tableView = tableView;
    self.tableView.backgroundView = nil;
    self.tableView.backgroundColor = [UIColor whiteColor];
    [self refreshData];
}

-(void)refreshData
{
    [WeatherDataSourceModel getData:^(NSArray * obj) {
        datas = obj;
        [SavaData save:datas withKey:bufferCardDataKey];
        [_tableView reloadData];
    }];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 120.0f;
    }
    return 98.0f;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [datas count];//[[WeatherDataSourceModel getCitys]count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CardCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    NSInteger row = indexPath.row;
    WeatherModels *data = [datas objectAtIndex:row] ;
    if (!cell.isInit && data) {
        [cell renderLabel:data];
        cell.isInit = YES;
    }
    cell.units = _cellTempUnits;
    return cell;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    FooterView *v = [tableView dequeueReusableCellWithIdentifier:footerID];
    v.cellTempUnits = _cellTempUnits;
    return v;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 98.0f;
}


@end
