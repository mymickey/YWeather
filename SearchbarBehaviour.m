//
//  SearchbarBehaviour.m
//  YWeather
//
//  Created by mickey on 15/8/23.
//  Copyright (c) 2015年 mickey. All rights reserved.
//

#import "SearchbarBehaviour.h"
#import "CityPinYinModel.h"
#import "Pods/ObjectiveSugar/Classes/ObjectiveSugar.h"
#import "SearchViewController.h"

@implementation SearchbarBehaviour

-(void)awakeFromNib
{
    [self performSelector:@selector(delayFocus) withObject:self afterDelay:0];
}
-(void)delayFocus
{
    [self.searchCtrl setActive:YES animated:YES];
    [self.searchCtrl.searchBar becomeFirstResponder];
    
}
#pragma mark searchbar

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    SearchViewController *searchCtrl = self.owner;
    [searchCtrl dismissViewControllerAnimated:YES completion:nil];
}
-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    [self.searchCtrl.searchBar setShowsCancelButton:YES animated:NO];
}

#pragma mark searchDisplayController
- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    NSDictionary *dict = [CityPinYinModel get_city_dict];
    NSString *upStr = [searchString uppercaseString];
    BOOL has = [dict hasKey:searchString];
    BOOL upHas = [dict hasKey:upStr];
    SearchViewController *searchCtrl = self.owner;
    NSArray *arr = @[];
    if (has || upHas) {
        NSString *key = has ?searchString:upStr;
        id values = [dict objectForKey:key];
        if ([values isKindOfClass:[NSArray class]]) {
            arr = values;
        }
        else{
            arr = @[values];
        }
    }
    searchCtrl.results = arr;
    return YES;
}

@end
