//
//  WeatherModeToggleBehaviour.m
//  YWeather
//
//  Created by mickey on 15/8/22.
//  Copyright (c) 2015年 mickey. All rights reserved.
//

#import "WeatherModeToggleBehaviour.h"
#import "CardCell.h"
@implementation WeatherModeToggleBehaviour

- (IBAction)btn_c_click:(id)sender {
    self.tableViewDelegate.cellTempUnits = CardTempUnits_C;
}

- (IBAction)btn_f_click:(id)sender {
    self.tableViewDelegate.cellTempUnits = CardTempUnits_K;
}
@end
