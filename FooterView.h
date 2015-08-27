//
//  FooterView.h
//  YWeather
//
//  Created by mickey on 15/8/22.
//  Copyright (c) 2015年 mickey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CardCell.h"
@interface FooterView : UITableViewCell
@property (assign,nonatomic) CardTempUnits cellTempUnits;
@property (weak, nonatomic) IBOutlet UIButton *btnC;
@property (weak, nonatomic) IBOutlet UIButton *btnF;
- (IBAction)onOpenAPIClick:(id)sender;


@end
