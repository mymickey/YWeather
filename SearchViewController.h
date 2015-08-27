//
//  SearchViewController.h
//  YWeather
//
//  Created by mickey on 15/8/23.
//  Copyright (c) 2015年 mickey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchResultModel.h"
@protocol SearchViewControllerDelegate<NSObject>
-(void)onSearchComplate:(SearchResultModel *)model;
@end

@interface SearchViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UISearchDisplayDelegate>

//@property (strong, nonatomic) IBOutlet UISearchDisplayController *searchDisplayCtrl;
@property (nonatomic,strong)NSArray *results;
@property(nonatomic,assign) id <SearchViewControllerDelegate> delegate;
@end
