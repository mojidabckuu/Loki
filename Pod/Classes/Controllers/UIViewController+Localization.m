//
//  UIViewController+Localization.m
//  Pods
//
//  Created by vlad gorbenko on 12/6/15.
//
//

#import "UIViewController+Localization.h"

@implementation UIViewController (Localization)

#pragma mark - Accessors

- (NSString *)localizedTitle {
    return self.title;
}

#pragma mark - Modifiers

- (void)setLocalizedTitle:(NSString *)localizedTitle {
    self.title = NSLocalizedString(localizedTitle, nil);
}

@end
