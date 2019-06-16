//
//  UIButton+HighlightedBackgroundColor.m
//  Kanaco
//
//  Created by yayoi on 2019/06/16.
//  Copyright © 2019 Y.Grace. All rights reserved.
//

#import "UIButton+HighlightedBackgroundColor.h"

@implementation UIButton (HighlightedBackgroundColor)

- (void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    if(highlighted == YES){
        self.alpha = 0.5;
    }
    else{
        self.alpha = 1.0;
    }
}

@end
