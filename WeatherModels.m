//
//  WeatherModels.m
//  YWeather
//
//  Created by mickey on 15/8/17.
//  Copyright (c) 2015年 mickey. All rights reserved.
//

#import "WeatherModels.h"
#import "Pods/Mantle/Mantle/MTLValueTransformer.h"
#import "Pods/Mantle/Mantle/MTLModel.h"
#import "NSDictionary+MTLMappingAdditions.h"
#import "Pods/Mantle/Mantle/MTLJSONAdapter.h"
#import "Pods/ObjectiveSugar/Classes/ObjectiveSugar.h"
#import "CityPinYinModel.h"
@implementation WeatherModels

+(NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             
             @"message":@"message",
             @"cod":@"cod",
             @"list":@"list",
             @"cnt":@"cnt",
             @"city_id":@"city.id",
             @"city_name":@"city.name",
             @"city_coord_lon":@"city.coord.lon",
             @"city_coord_lat":@"city.coord.lat",
             @"city_country":@"city.country",
             @"city_population":@"city.population",
             @"city_sys_population":@"city.sys.population",
             };
}
+ (NSValueTransformer *)listJSONTransformer
{
    return [MTLJSONAdapter arrayTransformerWithModelClass:[WeatherListModel class]];
}
+(NSValueTransformer *)city_nameJSONTransformer
{
    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSString * cityName, BOOL *success, NSError *__autoreleasing *error) {
        NSDictionary *citys = [CityPinYinModel get_city_dict];
        NSString *py = [cityName lowercaseString];
        BOOL hasZhName = [citys hasKey:py];
        NSString *name = cityName;
        if (hasZhName) {
            NSDictionary *dict = [citys objectForKey:py];
            name = [dict objectForKey:@"name"];
        }
        return  name;
    }];
}

@end




@implementation WeatherListModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"dt":@"dt",
             @"dt_txt":@"dt_txt",
             
             @"main_humidity":@"main.humidity",
             @"main_temp_min":@"main.temp_min",
             @"main_temp_kf":@"main.temp_kf",
             @"main_temp_max":@"main.temp_max",
             @"main_temp_k":@"main.temp",
             @"main_temp_c":@"main.temp",
             @"main_pressure":@"main.pressure",
             @"main_sea_level":@"main.sea_level",
             @"main_grnd_level":@"main.grnd_level",
             
             @"wind_speed":@"wind.speed",
             @"wind_deg":@"wind.deg",
             @"clouds_all":@"clouds.all",
             
             @"weather_main":@"weather",
             @"weather_desc":@"weather",
             @"weather_icon":@"weather",
             
             @"date_text":@"dt"
             };
}
+ (NSDateFormatter *)dateFormatter
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    dateFormatter.dateFormat = @"HH:mm";
    return dateFormatter;
}
+(NSValueTransformer *)main_temp_cJSONTransformer
{
    return [MTLValueTransformer transformerUsingForwardBlock:^id(id value, BOOL *success, NSError *__autoreleasing *error) {
        return @([value floatValue] - 273.0f);
    }];
}
+(NSValueTransformer *)date_textJSONTransformer
{
    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSNumber * value, BOOL *success, NSError *__autoreleasing *error) {
        float f = value.floatValue;
        NSDate *date = [NSDate dateWithTimeIntervalSince1970:f];
        return [self.dateFormatter stringFromDate:date];
    }];
}
+ (NSValueTransformer *)weather_mainJSONTransformer
{
    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSArray * value, BOOL *success, NSError *__autoreleasing *error) {
        NSString * result;
        if ([value count]) {
            for (NSInteger i = 0; i<[value count]; i++) {
                NSDictionary *dict = value[i];
                if ([dict hasKey:@"main"]) {
                    result = [dict valueForKey:@"main"];
                    break;
                }
            }
        }
        return result;
    }];
}
+ (NSValueTransformer *)weather_descJSONTransformer
{
    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSArray * value, BOOL *success, NSError *__autoreleasing *error) {
        NSString * result;
        if ([value count]) {
            for (NSInteger i = 0; i<[value count]; i++) {
                NSDictionary *dict = value[i];
                if ([dict hasKey:@"description"]) {
                    result = [dict valueForKey:@"description"];
                    break;
                }
            }
        }
        return result;
    }];
}
+ (NSValueTransformer *)weather_iconJSONTransformer
{
    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSArray * value, BOOL *success, NSError *__autoreleasing *error) {
        NSString * result;
        if ([value count]) {
            for (NSInteger i = 0; i<[value count]; i++) {
                NSDictionary *dict = value[i];
                if ([dict hasKey:@"icon"]) {
                    result = [dict valueForKey:@"icon"];
                    break;
                }
            }
        }
        return result;
    }];
}
@end


