//
//  CardCell.h
//  YWeather
//
//  Created by mickey on 15/8/15.
//  Copyright (c) 2015年 mickey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeatherModels.h"
typedef enum :NSUInteger{
    CardTempUnits_C,//摄氏度
    CardTempUnits_K//开氏度
}CardTempUnits;
@interface CardCell : UITableViewCell
{
    WeatherModels * _weatherData;
}
@property(nonatomic,assign)CGFloat topOffset;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *viewConstraintTop;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UILabel *cityName;
@property (weak, nonatomic) IBOutlet UILabel *temp;
@property(nonatomic,assign)BOOL isInit;
-(void)renderLabel:(WeatherModels *)dict;
@property(assign,nonatomic) CardTempUnits units;


@end
