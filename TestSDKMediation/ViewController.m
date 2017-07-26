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
@import AppLovinSDK;

@interface ViewController () <MaioDelegate, UnityAdsDelegate, TJPlacementDelegate, TJPlacementVideoDelegate, ALAdLoadDelegate, ALAdVideoPlaybackDelegate, ALAdDisplayDelegate, UIPickerViewDataSource, UIPickerViewDelegate>
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
        
        [ALIncentivizedInterstitialAd shared].adDisplayDelegate = self;
        [ALIncentivizedInterstitialAd shared].adVideoPlaybackDelegate = self;
        [ALIncentivizedInterstitialAd preloadAndNotify:self];
    });
}

- (void)showWithMethodNames:(SEL)selector ADNWName:(NSString *)ADNWName {
    NSLog(@"ADNW: %@,  Method Name: %@", ADNWName, NSStringFromSelector(selector));
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
        case 3:
            [ALIncentivizedInterstitialAd showAndNotify:self];
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
             @"Tapjoy",
             @"Applovin",
             ];
}

#pragma mark - Maio delegate

- (void)maioDidClickAd:(NSString *)zoneId {
    [self showWithMethodNames:_cmd ADNWName:@"Maio"];
}

- (void)maioDidCloseAd:(NSString *)zoneId {
    [self showWithMethodNames:_cmd ADNWName:@"Maio"];
}

- (void)maioWillStartAd:(NSString *)zoneId {
    [self showWithMethodNames:_cmd ADNWName:@"Maio"];
}

- (void)maioDidInitialize {
    [self showWithMethodNames:_cmd ADNWName:@"Maio"];
}

- (void)maioDidFail:(NSString *)zoneId reason:(MaioFailReason)reason {
    [self showWithMethodNames:_cmd ADNWName:@"Maio"];
}

- (void)maioDidChangeCanShow:(NSString *)zoneId newValue:(BOOL)newValue {
    [self showWithMethodNames:_cmd ADNWName:@"Maio"];
}

- (void)maioDidFinishAd:(NSString *)zoneId playtime:(NSInteger)playtime skipped:(BOOL)skipped rewardParam:(NSString *)rewardParam {
    [self showWithMethodNames:_cmd ADNWName:@"Maio"];
}

# pragma mark - UnityAds delegate

- (void)unityAdsReady:(NSString *)placementId {
    [self showWithMethodNames:_cmd ADNWName:@"UnityAds"];
}

- (void)unityAdsDidStart:(NSString *)placementId {
    [self showWithMethodNames:_cmd ADNWName:@"UnityAds"];
}

- (void)unityAdsDidError:(UnityAdsError)error withMessage:(NSString *)message {
    [self showWithMethodNames:_cmd ADNWName:@"UnityAds"];
}

- (void)unityAdsDidFinish:(NSString *)placementId withFinishState:(UnityAdsFinishState)state {
    [self showWithMethodNames:_cmd ADNWName:@"UnityAds"];
}

# pragma mark - Tapjoy delegate

- (void)videoDidStart:(TJPlacement *)placement {
    NSLog(@"Video did start for: %@", placement.placementName);
    [self showWithMethodNames:_cmd ADNWName:@"Tapjoy"];
}

- (void)videoDidComplete:(TJPlacement*)placement {
    NSLog(@"Video has completed for: %@", placement.placementName);
    [self showWithMethodNames:_cmd ADNWName:@"Tapjoy"];
}

- (void)videoDidFail:(TJPlacement*)placement error:(NSString*)errorMsg {
    NSLog(@"Video did fail for: %@ with error: %@", placement.placementName, errorMsg);
    [self showWithMethodNames:_cmd ADNWName:@"Tapjoy"];
}

- (void)requestDidSucceed:(TJPlacement*)placement
{
    [self showWithMethodNames:_cmd ADNWName:@"Tapjoy"];
}

- (void)contentIsReady:(TJPlacement*)placement
{
    [self showWithMethodNames:_cmd ADNWName:@"Tapjoy"];
}

- (void)requestDidFail:(TJPlacement*)placement error:(NSError *)error
{
    [self showWithMethodNames:_cmd ADNWName:@"Tapjoy"];
}

- (void)contentDidAppear:(TJPlacement*)placement
{
    [self showWithMethodNames:_cmd ADNWName:@"Tapjoy"];
}

- (void)contentDidDisappear:(TJPlacement*)placement
{
    [self showWithMethodNames:_cmd ADNWName:@"Tapjoy"];
}

- (void)placement:(TJPlacement*)placement didRequestPurchase:(TJActionRequest*)request productId:(NSString*)productId
{
    [self showWithMethodNames:_cmd ADNWName:@"Tapjoy"];
}


- (void)placement:(TJPlacement*)placement didRequestReward:(TJActionRequest*)request itemId:(NSString*)itemId quantity:(int)quantity
{
    [self showWithMethodNames:_cmd ADNWName:@"Tapjoy"];
}


- (void)placement:(TJPlacement*)placement didRequestCurrency:(TJActionRequest*)request currency:(NSString*)currency amount:(int)amount
{
    [self showWithMethodNames:_cmd ADNWName:@"Tapjoy"];
}


- (void)placement:(TJPlacement*)placement didRequestNavigation:(TJActionRequest*)request location:(NSString *)location
{
    [self showWithMethodNames:_cmd ADNWName:@"Tapjoy"];
}

# pragma mark - Applovin delegate

- (void)adService:(ALAdService *)adService didLoadAd:(ALAd *)ad {
    [self showWithMethodNames:_cmd ADNWName:@"Applovin"];
}

- (void)adService:(ALAdService *)adService didFailToLoadAdWithError:(int)code {
    [self showWithMethodNames:_cmd ADNWName:@"Applovin"];
}

- (void)ad:(ALAd *)ad wasHiddenIn:(UIView *)view {
    [self showWithMethodNames:_cmd ADNWName:@"Applovin"];
}

- (void)ad:(ALAd *)ad wasClickedIn:(UIView *)view {
    [self showWithMethodNames:_cmd ADNWName:@"Applovin"];
}

- (void)ad:(ALAd *)ad wasDisplayedIn:(UIView *)view {
    [self showWithMethodNames:_cmd ADNWName:@"Applovin"];
}

- (void)videoPlaybackBeganInAd:(ALAd *)ad {
    [self showWithMethodNames:_cmd ADNWName:@"Applovin"];
}

- (void)videoPlaybackEndedInAd:(ALAd *)ad atPlaybackPercent:(NSNumber *)percentPlayed fullyWatched:(BOOL)wasFullyWatched {
    [self showWithMethodNames:_cmd ADNWName:@"Applovin"];
}

@end
