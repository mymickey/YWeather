//
//  SearchbarBehaviour.h
//  YWeather
//
//  Created by mickey on 15/8/23.
//  Copyright (c) 2015年 mickey. All rights reserved.
//

#import "KZBehaviour.h"
#import "SearchViewController.h"

@interface SearchbarBehaviour : KZBehaviour<UISearchDisplayDelegate,UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UISearchDisplayController *searchCtrl;

@end
