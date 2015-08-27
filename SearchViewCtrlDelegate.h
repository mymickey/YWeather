//
//  SearchViewCtrlDelegate.h
//  YWeather
//
//  Created by mickey on 15/8/24.
//  Copyright (c) 2015年 mickey. All rights reserved.
//

#import "KZBehaviour.h"
#import "SearchViewController.h"
#import "TableViewDelegate.h"
@interface SearchViewCtrlDelegate : KZBehaviour<SearchViewControllerDelegate>
@property (weak, nonatomic) IBOutlet TableViewDelegate *tableViewDelegate;

@end
