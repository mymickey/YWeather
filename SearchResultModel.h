//
//  SearchResultModel.h
//  YWeather
//
//  Created by mickey on 15/8/23.
//  Copyright (c) 2015年 mickey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MTLModel.h"
#import "Pods/Mantle/Mantle/MTLJSONAdapter.h"

@interface SearchResultModel   : MTLModel<MTLJSONSerializing>
@property(copy,nonatomic) NSString * cityName;
@property(copy,nonatomic)NSString *py;
@end
