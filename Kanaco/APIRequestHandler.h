//
//  APIRequestHandler.h
//  Kanaco
//
//  Created by yayoi on 2019/06/12.
//  Copyright © 2019 Y.Grace. All rights reserved.
//  ひらがなAPIと通信を行うクラス

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface APIRequestHandler : NSObject
- (void)requestWithBaseURL:(nonnull NSString *)baseURLString Params:(nonnull NSDictionary *)params delegate:(nullable id)delegate;
@end

@protocol APIRequestHandlerDelegate <NSObject>

@optional
- (void)didFinishWithResponse:(nonnull NSDictionary *)response;
- (void)didFailWithError:(nullable NSError *)error;
@end

NS_ASSUME_NONNULL_END
