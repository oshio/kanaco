//
//  MainViewController+ShowAlert.h
//  Kanaco
//
//  Created by yayoi on 2019/06/15.
//  Copyright © 2019 Y.Grace. All rights reserved.
//

#import "MainViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface MainViewController (ShowAlert)
- (void)showAutoDismissAlertWithTitle:(nullable NSString *)title message:(nullable NSString *)message;
@end

NS_ASSUME_NONNULL_END
