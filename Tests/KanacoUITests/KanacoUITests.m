//
//  KanacoUITests.m
//  KanacoUITests
//
//  Created by yayoi on 2019/06/12.
//  Copyright © 2019 Y.Grace. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface KanacoUITests : XCTestCase

@end

@implementation KanacoUITests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.

    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;

    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];

    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

//変換のテスト
- (void)testConversion
{
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.textViews[@"入力エリア"] tap];
    [app.textViews[@"入力エリア"] typeText:@"変換できているか確認します"];
    [app.buttons[@"ひらがなにする"] tap];
    XCTAssertEqualObjects(app.textViews[@"結果表示エリア"].value, @"へんかんできているか かくにんします");
}

//文字をけすボタンのテスト
- (void)testClearButton
{
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.textViews[@"入力エリア"] tap];
    [app.textViews[@"入力エリア"] typeText:@"文字を消せるか確認します"];
    [app.buttons[@"けす"] tap];
    XCTAssertEqualObjects(app.textViews[@"入力エリア"].value, @"");
}

@end
