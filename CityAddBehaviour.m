//
//  CityAddBehaviour.m
//  YWeather
//
//  Created by mickey on 15/8/23.
//  Copyright (c) 2015年 mickey. All rights reserved.
//

#import "CityAddBehaviour.h"

@implementation CityAddBehaviour
- (IBAction)cityAddClick:(id)sender {
    UIViewController *vc = self.owner;
    [vc performSegueWithIdentifier:@"toAddCity" sender:@{@"info":@"code"}];
}
@end
