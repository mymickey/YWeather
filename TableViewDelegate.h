//
//  TableViewDelegate.h
//  YWeather
//
//  Created by mickey on 15/8/15.
//  Copyright (c) 2015年 mickey. All rights reserved.
//

#import "KZBehaviour.h"
#import "CardCell.h"
@interface TableViewDelegate : KZBehaviour<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (assign,nonatomic) CardTempUnits cellTempUnits;
-(void)refreshData;
@end
