//
//  KanaConverter.m
//  Kanaco
//
//  Created by yayoi on 2019/06/12.
//  Copyright © 2019 Y.Grace. All rights reserved.
//

#import "KanaConverter.h"
#import <KanacoKeys.h>

static NSString *const kanaAPIBaseURL = @"https://labs.goo.ne.jp/api/hiragana";

@interface KanaConverter()
@property (nonatomic) id<KanaConverterDelegate> delegate;
@end

@implementation KanaConverter

- (id)initWithDelegate:(nonnull id<KanaConverterDelegate>)delegate
{
    self = [super init];
    
    if(self != nil){
        self.delegate = delegate;
    }
    
    return self;
}

- (void)requestWithInputString:(nonnull NSString *)inputString
{
    //cocoapods-keysで保存したキーの取り出し
    KanacoKeys *keys = [[KanacoKeys alloc] init];
    NSString *APIKey = keys.aPIKey;
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:APIKey forKey:@"app_id"];
    [params setObject:@"hiragana" forKey:@"output_type"];
    [params setObject:inputString forKey:@"sentence"];
 
    APIRequestHandler *requestHandler = [[APIRequestHandler alloc] init];
    [requestHandler requestWithBaseURL:kanaAPIBaseURL Params:params delegate:self];
}

- (void)didFinishWithResponse:(nonnull NSDictionary *)response
{
    NSString *outputString = [response objectForKey:@"converted"];
    if(self.delegate != nil && [self.delegate respondsToSelector:@selector(didReceiveOutputString:)] == YES){
        [self.delegate didReceiveOutputString:outputString];
    }
}

- (void)didFailWithError:(nullable NSError *)error
{
    if(self.delegate != nil && [self.delegate respondsToSelector:@selector(didReceiveError:)] == YES){
        [self.delegate didReceiveError:error];
    }
}

@end
