//
//  UIView+Localized.m
//
//
//  Created by Vlad Gorbenko on 5/25/15.
//  Copyright (c) 2015 Vlad Gorbenko. All rights reserved.
//

#import "UIView+Localization.h"

#import "LKManager.h"

#import <objc/runtime.h>

@implementation UIView (Localization)

#pragma mark - Accessors

- (BOOL)isLocalized {
    return [objc_getAssociatedObject(self, @selector(isLocalized)) boolValue];
}

- (void)setIsLocalized:(BOOL)isLocalized {
    objc_setAssociatedObject(self, @selector(isLocalized), @(isLocalized), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (isLocalized) {
        [self localize];
    }
}

- (NSLocaleLanguageDirection)controlDirection {
    NSLocaleLanguageDirection direction = [objc_getAssociatedObject(self, @selector(controlDirection)) integerValue];
    if (direction == NSLocaleLanguageDirectionUnknown) {
        return NSLocaleLanguageDirectionLeftToRight;
    }
    return direction;
}

- (void)setControlDirection:(NSLocaleLanguageDirection)controlDirection {
    objc_setAssociatedObject(self, @selector(controlDirection), @(controlDirection), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark - Localization

- (void)flipView{
    if (CGAffineTransformEqualToTransform(self.transform, CGAffineTransformIdentity)) {
        self.transform = CGAffineTransformMake(-1, 0, 0, 1, 0, 0);
    }else{
        self.transform = CGAffineTransformIdentity;
    }
}

- (void)flipAlignment{
}

- (void)localize {
    if (self.isLocalized) {
        if ([LKManager sharedInstance].currentLanguage.direction != self.controlDirection) {
            self.controlDirection = [LKManager sharedInstance].currentLanguage.direction;
            [self flipView];
            for (id subview in self.subviews) {
                [subview flipView];
            }
        }
    }
}

- (void)localizeSubviews{
    for (id subView in self.subviews){
        [subView localize];
        if ([subView subviews].count > 0){
            [subView localizeSubviews];
        }
    }
}



@end
