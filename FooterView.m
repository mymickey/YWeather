//
//  FooterView.m
//  YWeather
//
//  Created by mickey on 15/8/22.
//  Copyright (c) 2015年 mickey. All rights reserved.
//

#import "FooterView.h"

@implementation FooterView

-(void)setCellTempUnits:(CardTempUnits)cellTempUnits
{
    _cellTempUnits = cellTempUnits;
    if (_cellTempUnits == CardTempUnits_K) {
        _btnC.alpha = .6;
        _btnF.alpha = 1;
    }else{
        _btnC.alpha = 1;
        _btnF.alpha = .6;
    }
}

- (IBAction)onOpenAPIClick:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://openweathermap.org/current"]];
}
@end
