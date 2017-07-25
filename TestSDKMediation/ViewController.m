//
//  ViewController.m
//  TestSDKMediation
//
//  Created by 清 貴幸 on 2017/07/24.
//  Copyright © 2017年 daybysay. All rights reserved.
//

#import "ViewController.h"
#import <Tapjoy/Tapjoy.h>
@import Maio;
@import UnityAds;

@interface ViewController () <MaioDelegate, UnityAdsDelegate, TJPlacementDelegate, TJPlacementVideoDelegate, UIPickerViewDataSource, UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (nonatomic) TJPlacement *p;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.p = [TJPlacement placementWithName:@"" delegate:self];
        self.p.videoDelegate = self;
        [self.p requestContent];
    });
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
        case 1:
            [UnityAds show:self];
            break;
        case 2:
            [self.p showContentWithViewController:self];
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
             @"Tapjoy"
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

# pragma mark - UnityAds delegate

- (void)unityAdsReady:(NSString *)placementId {
    [self showWithMethodNames:_cmd];
}

- (void)unityAdsDidStart:(NSString *)placementId {
    [self showWithMethodNames:_cmd];
}

- (void)unityAdsDidError:(UnityAdsError)error withMessage:(NSString *)message {
    [self showWithMethodNames:_cmd];
}

- (void)unityAdsDidFinish:(NSString *)placementId withFinishState:(UnityAdsFinishState)state {
    [self showWithMethodNames:_cmd];
}

# pragma mark - Tapjoy delegate

- (void)videoDidStart:(TJPlacement *)placement {
    NSLog(@"Video did start for: %@", placement.placementName);
    [self showWithMethodNames:_cmd];
}

- (void)videoDidComplete:(TJPlacement*)placement {
    NSLog(@"Video has completed for: %@", placement.placementName);
    [self showWithMethodNames:_cmd];
}

- (void)videoDidFail:(TJPlacement*)placement error:(NSString*)errorMsg {
    NSLog(@"Video did fail for: %@ with error: %@", placement.placementName, errorMsg);
    [self showWithMethodNames:_cmd];
}

- (void)requestDidSucceed:(TJPlacement*)placement
{
    [self showWithMethodNames:_cmd];
}

- (void)contentIsReady:(TJPlacement*)placement
{
    [self showWithMethodNames:_cmd];
}

- (void)requestDidFail:(TJPlacement*)placement error:(NSError *)error
{
    [self showWithMethodNames:_cmd];
}

- (void)contentDidAppear:(TJPlacement*)placement
{
    [self showWithMethodNames:_cmd];
}

- (void)contentDidDisappear:(TJPlacement*)placement
{
    [self showWithMethodNames:_cmd];
}

- (void)placement:(TJPlacement*)placement didRequestPurchase:(TJActionRequest*)request productId:(NSString*)productId
{
    [self showWithMethodNames:_cmd];
}


- (void)placement:(TJPlacement*)placement didRequestReward:(TJActionRequest*)request itemId:(NSString*)itemId quantity:(int)quantity
{
    [self showWithMethodNames:_cmd];
}


- (void)placement:(TJPlacement*)placement didRequestCurrency:(TJActionRequest*)request currency:(NSString*)currency amount:(int)amount
{
    [self showWithMethodNames:_cmd];
}


- (void)placement:(TJPlacement*)placement didRequestNavigation:(TJActionRequest*)request location:(NSString *)location
{
    [self showWithMethodNames:_cmd];
}

@end
