//
//  SearchViewCtrlDelegate.m
//  YWeather
//
//  Created by mickey on 15/8/24.
//  Copyright (c) 2015年 mickey. All rights reserved.
//

#import "SearchViewCtrlDelegate.h"
#import "WeatherDataSourceModel.h"
@implementation SearchViewCtrlDelegate
-(void)onSearchComplate:(SearchResultModel *)model
{
    [WeatherDataSourceModel addCity:model.py];
    [self.tableViewDelegate refreshData];
}



@end
