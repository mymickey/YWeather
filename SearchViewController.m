//
//  SearchViewController.m
//  YWeather
//
//  Created by mickey on 15/8/23.
//  Copyright (c) 2015年 mickey. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchResultModel.h"
#import "CityPinYinModel.h"
#import "Pods/ObjectiveSugar/Classes/ObjectiveSugar.h"

static NSString * const searchCellID= @"RESULTCELL";
@interface SearchViewController ()

@end

@implementation SearchViewController
-(void)setResults:(NSArray *)results
{
    NSMutableArray *arr = [NSMutableArray new];
    for (NSInteger i= 0; [results count] > i; i++) {
        SearchResultModel * m = [SearchResultModel new];
        NSDictionary *dict = [results objectAtIndex:i];
        m.cityName = [dict objectForKey:@"name"];
        m.py = [dict objectForKey:@"py"];
        [arr addObject:m];
    }
    
    
    _results = arr;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_results count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:searchCellID ];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:searchCellID];
    }
    SearchResultModel *m = [_results objectAtIndex:indexPath.row];
    if (m) {
        cell.textLabel.text = m.cityName;
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SearchResultModel *m = [_results objectAtIndex:indexPath.row];
    [self dismissViewControllerAnimated:YES completion:nil];
    if ([self.delegate respondsToSelector:@selector(onSearchComplate:)]) {
        [self.delegate onSearchComplate:m];
    }
}






@end
