//
//  MainViewController+ShowAlert.m
//  Kanaco
//
//  Created by yayoi on 2019/06/15.
//  Copyright © 2019 Y.Grace. All rights reserved.
//

#import "MainViewController+ShowAlert.h"

@implementation MainViewController (ShowAlert)

- (void)showAutoDismissAlertWithTitle:(NSString *)title message:(NSString *)message
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [self presentViewController:alert animated:YES completion:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [alert dismissViewControllerAnimated:YES completion:nil];
        });
    }];
}

@end
