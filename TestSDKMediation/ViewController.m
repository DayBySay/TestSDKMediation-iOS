//
//  ViewController.m
//  TestSDKMediation
//
//  Created by 清 貴幸 on 2017/07/24.
//  Copyright © 2017年 daybysay. All rights reserved.
//

#import "ViewController.h"
@import Maio;

@interface ViewController () <MaioDelegate, UIPickerViewDataSource, UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)showWithMethodNames:(SEL)selector {
    NSLog(@"Method Name: %@", NSStringFromSelector(selector));
}

- (IBAction)didTouchUpShowAdButton:(id)sender {
    [self showAdsWithIndex:[self.pickerView selectedRowInComponent:0]];
}

- (void)showAdsWithIndex:(NSInteger)index {
    switch (index) {
        case 0:
            [Maio show];
            break;
        default:
            break;
    }
}

#pragma mark - Picker View
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [[self ADNWs] objectAtIndex:row];
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [self ADNWs].count;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSArray *)ADNWs {
    return @[
             @"Maio",
             @"Unity Ads",
             ];
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
