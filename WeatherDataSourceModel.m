//
//  WeatherDataSourceModel.m
//  YWeather
//
//  Created by mickey on 15/8/20.
//  Copyright (c) 2015年 mickey. All rights reserved.
//

#import "WeatherDataSourceModel.h"
#import "WeatherModels.h"
#import "Pods/AFNetworking/AFNetworking/AFHTTPRequestOperationManager.h"
#import "Pods/TMCache/TMCache/TMCache.h"
#import "SavaData.h"
#import "Pods/ObjectiveSugar/Classes/ObjectiveSugar.h"

static NSString *const saveKey = @"citylist";
static NSString *const address = @"http://api.openweathermap.org/data/2.5/forecast?q=%@&lang=zh";
@implementation WeatherDataSourceModel
+(NSArray *)getCitys
{
    NSArray *cityList = [SavaData getOldDataWithKey:saveKey];
    if (!cityList || ![cityList count]) {
        cityList = @[];
    }
    NSMutableArray *cityList2  = [[NSMutableArray alloc] initWithArray:cityList];
    return cityList2;
}
+(void)addCity:(NSString *)cityName
{
    NSArray *cityList = [SavaData getOldDataWithKey:saveKey];
    NSInteger index = [cityList indexOfObject:cityName];
    
    if (!cityList || ![cityList count]) {
        cityList = @[];
    }
    else if(index != NSNotFound){
        return;
    }
    NSMutableArray *cityList2  = [[NSMutableArray alloc] initWithArray:cityList];
    [cityList2 addObject:cityName];
    [SavaData save:cityList2 withKey:saveKey];
}
+(void)getData:(void (^)(id))block
{
    NSArray *citys = [self getCitys];
    NSMutableArray *requests = [NSMutableArray new];
    for (NSInteger i = 0 ; [citys count]>i; i++) {
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:address,citys[i]]];
        NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
        AFHTTPRequestOperation *ro = [[AFHTTPRequestOperation alloc] initWithRequest:request];
        ro.responseSerializer = [AFJSONResponseSerializer  serializer];
        [requests addObject:ro];
    }
    NSArray *operations = [AFURLConnectionOperation batchOfRequestOperations:requests progressBlock:^(NSUInteger numberOfFinishedOperations, NSUInteger totalNumberOfOperations) {
        NSLog(@"request weather :%lu of %lu complete", (unsigned long)numberOfFinishedOperations, totalNumberOfOperations);
    } completionBlock:^(NSArray *operations) {
        NSMutableArray *arr = [NSMutableArray new];
        NSError *err ;
        for (NSInteger i = 0; [operations count] > i; i++) {
            NSDictionary *dict = [[operations objectAtIndex:i] responseObject];
            [arr addObject:[MTLJSONAdapter modelOfClass:[WeatherModels class] fromJSONDictionary:dict error:&err]];
        }
        block(arr);
    }];
    [[NSOperationQueue mainQueue] addOperations:operations waitUntilFinished:NO];
}
@end
