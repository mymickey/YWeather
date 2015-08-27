//
//  ViewController.m
//  YWeather
//
//  Created by mickey on 15/8/15.
//  Copyright (c) 2015年 mickey. All rights reserved.
//

#import "ViewController.h"
#import "SearchViewController.h"
#import "SearchViewCtrlDelegate.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier  isEqual: @"toAddCity"]) {
        SearchViewController *s = segue.destinationViewController;
        s.delegate = self.searchViewCtrlDelegate;
    }
}
@end
