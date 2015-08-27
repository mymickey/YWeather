//
//  CityPinYinModel.m
//  YWeather
//
//  Created by mickey on 15/8/21.
//  Copyright (c) 2015年 mickey. All rights reserved.
//

#import "CityPinYinModel.h"
#import "objc/runtime.h"
@implementation CityPinYinModel

+(NSDictionary *)get_city_dict
{
    return @{
             @"shanghai":@{@"name":@"上海",@"py":@"shanghai"},
             @"sh":@[@{@"name":@"上海",@"py":@"shanghai"}],
             
             @"hangzhou":@{@"name":@"杭州",@"py":@"hangzhou"},
             @"hz":@[@{@"name":@"杭州",@"py":@"hangzhou"}],
             
             @"guilin":@{@"name":@"桂林",@"py":@"guilin"},
             @"gl":@[@{@"name":@"桂林",@"py":@"guilin"}],
             
             @"shenzhen":@{@"name":@"深圳",@"py":@"shenzhen"},
             @"sz":@[@{@"name":@"深圳",@"py":@"shenzhen"}],
             
             @"beijing":@{@"name":@"北京",@"py":@"beijing"},
             @"bj":@[@{@"name":@"北京",@"py":@"beijing"},@{@"name":@"宝鸡",@"py":@"baoji"}],
             
             @"guangzhou":@{@"name":@"广州",@"py":@"guangzhou"},
             @"gz":@[@{@"name":@"广州",@"py":@"guangzhou"}],
             
             @"nanjing":@{@"name":@"南京",@"py":@"nanjing"},
             @"nj":@[@{@"name":@"南京",@"py":@"nanjing"}],
             
             @"london":@{@"name":@"伦敦",@"py":@"london"},
             @"ld":@[@{@"name":@"伦敦",@"py":@"london"}],
           };
}

@end
