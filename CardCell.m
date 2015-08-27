//
//  CardCell.m
//  YWeather
//
//  Created by mickey on 15/8/15.
//  Copyright (c) 2015年 mickey. All rights reserved.
//

#import "CardCell.h"
#import "Pods/EDColor/EDColor/EDColor.h"
#import "Pods/ObjectiveSugar/Classes/ObjectiveSugar.h"
#import "Pods/AFNetworking/AFNetworking/AFNetworking.h"

@implementation CardCell


-(void)layoutSubviews
{
    [super layoutSubviews];
    if (self.contentView.frame.size.height == 120) {
        self.viewConstraintTop.constant = 20;
    }else{
        self.viewConstraintTop.constant = 0;
    }
    //[self updateConstraintsIfNeeded];
    //[self layoutIfNeeded];
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    self.layer.borderWidth = 0;
    NSArray *colors = [UIColor iOS7Colors];
    self.backgroundColor = colors.sample;
}
-(void)renderLabel:(WeatherModels *)dict
{
    _weatherData = dict;
    CardCell *cell = self;
    cell.cityName.text = dict.city_name;
    WeatherListModel *item = [dict.list objectAtIndex:0];
    cell.time.text = item.date_text;
    [self toggleUnits];
}
-(void)setUnits:(CardTempUnits)units
{
    _units = units;
    [self toggleUnits];
}
-(void)toggleUnits
{
    WeatherListModel *item = [_weatherData.list objectAtIndex:0];
    NSString *temp = [NSString stringWithFormat:@"%.0f°",item.main_temp_k];
    if (_units != CardTempUnits_K) {
        temp = [NSString stringWithFormat:@"%.0f°",item.main_temp_c];
    }
    NSUInteger strLen = [temp length] ;
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:temp];
    UIFont *font = [UIFont boldSystemFontOfSize:18];
    [attrStr addAttribute:NSFontAttributeName value:font range:NSMakeRange(strLen -1 , 1)];
    [attrStr addAttribute:NSBaselineOffsetAttributeName value:@25 range:NSMakeRange(strLen -1 , 1)];
    self.temp.attributedText = attrStr;
}
@end
