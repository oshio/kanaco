//
//  KanaConverterMock.m
//  KanacoTests
//
//  Created by yayoi on 2019/06/13.
//  Copyright © 2019 Y.Grace. All rights reserved.
//

#import "KanaConverterMock.h"

@implementation KanaConverterMock

- (void)didReceiveOutputString:(NSString *)outputString
{
    self.outputString = outputString;
    [self.expectation fulfill];
}

@end
