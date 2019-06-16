//
//  KanaConverterMock.h
//  KanacoTests
//
//  Created by yayoi on 2019/06/13.
//  Copyright © 2019 Y.Grace. All rights reserved.
//  KanaConverterテスト用にDelegateを実装したモッククラス

#import <Foundation/Foundation.h>
#import "KanaConverter.h"
@import XCTest;

NS_ASSUME_NONNULL_BEGIN

@interface KanaConverterMock : NSObject <KanaConverterDelegate>
@property (nonatomic) NSString *_Nonnull outputString;
@property (nonatomic) XCTestExpectation *_Nonnull expectation;
@end

NS_ASSUME_NONNULL_END
