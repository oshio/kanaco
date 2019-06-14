//
//  KanaConverter.h
//  Kanaco
//
//  Created by yayoi on 2019/06/12.
//  Copyright © 2019 Y.Grace. All rights reserved.
//  変換対象の文字列を渡すとひらがなAPIから取得した出力結果を返すクラス

#import <Foundation/Foundation.h>
#import "APIRequestHandler.h"

NS_ASSUME_NONNULL_BEGIN

@protocol KanaConverterDelegate;

@interface KanaConverter : NSObject <APIRequestHandlerDelegate>
- (id)initWithDelegate:(nonnull id<KanaConverterDelegate>)delegate;
- (void)requestWithInputString:(nonnull NSString *)inputString;
@end

@protocol KanaConverterDelegate <NSObject>
@optional
- (void)didReceiveOutputString:(nullable NSString *)outputString;
- (void)didReceiveError:(nullable NSError *)error;
@end

NS_ASSUME_NONNULL_END
