//
//  WeatherModels.h
//  YWeather
//
//  Created by mickey on 15/8/17.
//  Copyright (c) 2015年 mickey. All rights reserved.
//

#import "MTLModel.h"
#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import "Pods/Mantle/Mantle/MTLJSONAdapter.h"


@interface WeatherModels : MTLModel<MTLJSONSerializing>

@property (nonatomic, assign) float message;

@property (nonatomic, copy) NSString *cod;


@property (nonatomic, assign) NSInteger cnt;

@property (nonatomic, strong) NSArray *list;
//city start
@property(nonatomic,assign)NSInteger city_id;

@property(nonatomic,copy) NSString *city_country;

@property(nonatomic,copy)NSString *city_name;

@property(nonatomic,assign) NSInteger city_population;

@property(nonatomic,assign) NSInteger city_sys_population;

@property(nonatomic,assign) float city_coord_lon;

@property(nonatomic,assign) float city_coord_lat;


//city end



@end

@interface WeatherListModel : MTLModel<MTLJSONSerializing>
@property(nonatomic,copy) NSString * date_text;//近三小时的日期文本
@property (nonatomic, assign) NSInteger dt;
@property (nonatomic, copy) NSString *dt_txt;
//main start
@property (nonatomic, assign) NSInteger main_humidity;

@property (nonatomic, assign) float main_temp_min;

@property (nonatomic, assign) float main_temp_kf;

@property (nonatomic, assign) float main_temp_max;

@property (nonatomic, assign) float main_temp_k;

@property (nonatomic, assign) float main_temp_c;


@property (nonatomic, assign) float main_pressure;

@property (nonatomic, assign) float main_sea_level;

@property (nonatomic, assign) float main_grnd_level;
//main end

//wind start
@property (nonatomic, assign) float wind_speed;

@property (nonatomic, assign) float wind_deg;
//wind end

//clouds start
@property(nonatomic,assign) NSInteger clouds_all;
//clouds end

@property(nonatomic,strong)NSString *weather_main;
@property(nonatomic,strong)NSString *weather_desc;
@property(nonatomic,strong)NSString *weather_icon;
@end





//@interface WH_Clouds_model : MTLModel<MTLJSONSerializing>
//
//@property (nonatomic, assign) NSInteger all;
//
//@end
//
//@interface WH_Weather_model : MTLModel<MTLJSONSerializing>
//
//@property (nonatomic, assign) NSInteger id;
//
//@property (nonatomic, copy) NSString *main;
//
//@property (nonatomic, copy) NSString *icon;
//
//@property (nonatomic, copy) NSString *desc;
//
//@end

