//
//  VideoRewardAbstractAdapter.h
//  TestSDKMediation
//
//  Created by 清 貴幸 on 2017/07/24.
//  Copyright © 2017年 daybysay. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol VideoRewardMediationDelegate;

@interface VideoRewardAbstractAdapter : NSObject

@property (nonatomic, weak) id<VideoRewardMediationDelegate> delegate;

- (void)initWithConfiguration:(NSDictionary *)configuration;
- (void)Load;
- (BOOL)prepared;
- (void)show;

@end


typedef NS_ENUM(NSUInteger, VideoRewardLoadError) {
    VideoRewardLoadErrorNoFill
};

@protocol VideoRewardMediationDelegate

- (void)videoRewardDidLoad:(VideoRewardAbstractAdapter *)videoReward;
- (void)videoReward:(VideoRewardAbstractAdapter *)videoReward didFaileToLoadWithError:(VideoRewardLoadError)error;

- (void)videoRewardWillPlayVideo:(VideoRewardAbstractAdapter *)videoReward;
- (void)videoRewardFailedPlayeVideo:(VideoRewardAbstractAdapter *)videoReward;
- (void)videoRewardDidCompleteVideo:(VideoRewardAbstractAdapter *)videoReward;
- (void)videoRewardDidClose:(VideoRewardAbstractAdapter *)videoReward;

@end
