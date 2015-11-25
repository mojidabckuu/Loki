//
//  UIImageView+Localized.m
//
//
//  Created by Vlad Gorbenko on 5/25/15.
//  Copyright (c) 2015 Vlad Gorbenko. All rights reserved.
//

#import "UIImageView+Localization.h"

#import "LKManager.h"

@implementation UIImageView (Localization)

- (void)localize {
    if (self.isLocalized) {
        if ([LKManager sharedInstance].currentLanguage.direction != self.controlDirection) {
            self.controlDirection = [LKManager sharedInstance].currentLanguage.direction;
            [self flipView];
        }
    }
}

@end
