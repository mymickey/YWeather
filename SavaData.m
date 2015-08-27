//
//  SavaData.m
//  YWeather
//
//  Created by mickey on 15/8/25.
//  Copyright (c) 2015年 mickey. All rights reserved.
//

#import "SavaData.h"
#import "Pods/TMCache/TMCache/TMCache.h"
@implementation SavaData

+(id)getOldDataWithKey:(NSString *)key
{
    return [[TMCache sharedCache] objectForKey:key];
}
+(void)save:(id)data withKey:(NSString *)key
{
    [[TMCache sharedCache] setObject:data forKey:key];

}
@end
