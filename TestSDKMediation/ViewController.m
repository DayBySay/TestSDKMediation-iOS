//
//  ViewController.m
//  TestSDKMediation
//
//  Created by 清 貴幸 on 2017/07/24.
//  Copyright © 2017年 daybysay. All rights reserved.
//

#import "ViewController.h"
@import Maio;

@interface ViewController () <MaioDelegate>

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

- (void)showWithMethodNames:(SEL)selector {
    NSLog(@"Method Name: %@", NSStringFromSelector(selector));
}


#pragma mark - Maio delegate

- (void)maioDidClickAd:(NSString *)zoneId {
    [self showWithMethodNames:_cmd];
}

- (void)maioDidCloseAd:(NSString *)zoneId {
    [self showWithMethodNames:_cmd];
}

- (void)maioWillStartAd:(NSString *)zoneId {
    [self showWithMethodNames:_cmd];
}

- (void)maioDidInitialize {
    [self showWithMethodNames:_cmd];
}

- (void)maioDidFail:(NSString *)zoneId reason:(MaioFailReason)reason {
    [self showWithMethodNames:_cmd];
}

- (void)maioDidChangeCanShow:(NSString *)zoneId newValue:(BOOL)newValue {
    [self showWithMethodNames:_cmd];
}

- (void)maioDidFinishAd:(NSString *)zoneId playtime:(NSInteger)playtime skipped:(BOOL)skipped rewardParam:(NSString *)rewardParam {
    [self showWithMethodNames:_cmd];
}

@end
