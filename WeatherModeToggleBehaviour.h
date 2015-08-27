//
//  WeatherModeToggleBehaviour.h
//  YWeather
//
//  Created by mickey on 15/8/22.
//  Copyright (c) 2015年 mickey. All rights reserved.
//

#import "KZBehaviour.h"
#import "TableViewDelegate.h"
@interface WeatherModeToggleBehaviour : KZBehaviour
@property (weak, nonatomic) IBOutlet TableViewDelegate *tableViewDelegate;

- (IBAction)btn_c_click:(id)sender;

- (IBAction)btn_f_click:(id)sender;


@end
