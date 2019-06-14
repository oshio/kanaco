//
//  APIRequestHandler.m
//  Kanaco
//
//  Created by yayoi on 2019/06/12.
//  Copyright © 2019 Y.Grace. All rights reserved.
//

#import "APIRequestHandler.h"
#import <AFNetworking.h>

@interface APIRequestHandler ()
@property (nonatomic) AFHTTPSessionManager *sessionManager;
@property (nonatomic) NSURLSessionTask *sessionTask;
@end

@implementation APIRequestHandler

+ (AFHTTPSessionManager *)sharedManager
{
    //アクセスが1本のみになるように
    static AFHTTPSessionManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[AFHTTPSessionManager alloc] init];
    });
    
    return manager;
}

- (void)requestWithBaseURL:(nonnull NSString *)baseURLString Params:(nonnull NSDictionary *)params delegate:(nullable id)delegate
{
    if (self.sessionManager == nil){
        self.sessionManager = [APIRequestHandler sharedManager];
    }
    
    self.sessionTask = [self.sessionManager POST:baseURLString
                                      parameters:params
                                        progress:^(NSProgress * _Nonnull uploadProgress) {
                                            
                                        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                            if([(NSDictionary *)responseObject objectForKey:@"converted"] == nil){
                                                [delegate didFailWithError:nil];
                                                return;
                                            }

                                            if(delegate != nil && [delegate respondsToSelector:@selector(didFinishWithResponse:)] == YES){
                                                [delegate didFinishWithResponse:responseObject];
                                            }
                                        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                            if(delegate != nil && [delegate respondsToSelector:@selector(didFailWithError:)] == YES){
                                                [delegate didFailWithError:error];
                                            }
                                        }];
}

@end
