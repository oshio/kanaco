//
//  KanacoTests.m
//  KanacoTests
//
//  Created by yayoi on 2019/06/12.
//  Copyright © 2019 Y.Grace. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "KanaConverter.h"
#import "KanaConverterMock.h"

@interface KanacoTests : XCTestCase
@end

@implementation KanacoTests

- (void)setUp {
}

- (void)tearDown {
}

//KanaConverterによる変換結果が想定通りである
- (void)testConversionResult {
    NSString *inputString = @"変換できているか確認します。";
    NSString *outputStringAnswer = @"へんかんできているか かくにんします。";

    XCTestExpectation *expectation = [[XCTestExpectation alloc] initWithDescription:@"Conversion result with KanaConverter is correct"];
    KanaConverterMock *mock = [[KanaConverterMock alloc] init];
    mock.expectation = expectation;
    KanaConverter *converter = [[KanaConverter alloc] initWithDelegate:mock];
    [converter requestWithInputString:inputString];

    XCTWaiter *waiter = [[XCTWaiter alloc] init];
    [waiter waitForExpectations:@[expectation] timeout:3];

    XCTAssertEqualObjects(outputStringAnswer, mock.outputString);
}

@end
