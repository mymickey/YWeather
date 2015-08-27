//
//  WeatherDataSourceModel.h
//  YWeather
//
//  Created by mickey on 15/8/20.
//  Copyright (c) 2015年 mickey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherDataSourceModel : NSObject
+(NSArray *)getCitys;
+(void)addCity:(NSString *)cityName;
+(void)getData:(void (^)(id))block;
@end
