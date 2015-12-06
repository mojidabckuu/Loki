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

- (NSString *)localizedTitleKey {
    return self.title;
}

#pragma mark - Modifiers

- (void)setLocalizedTitleKey:(NSString *)localizedTitleKey {
    self.title = NSLocalizedString(localizedTitleKey, nil);
}

@end
