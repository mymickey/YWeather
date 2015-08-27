//
//  SavaData.h
//  YWeather
//
//  Created by mickey on 15/8/25.
//  Copyright (c) 2015年 mickey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SavaData : NSObject
+(id)getOldDataWithKey:(NSString *)key;
+(void)save:(id)data withKey:(NSString *)key;
@end
