//
//  UIButton+Localization.m
//
//
//  Created by Vlad Gorbenko on 5/25/15.
//  Copyright (c) 2015 Vlad Gorbenko. All rights reserved.
//

#import "UIButton+Localization.h"

#import "LKManager.h"

#import "UIView+Localization.h"

@import ObjectiveC.runtime;

@implementation UIButton (Localization)

#pragma mark - Accessors

- (NSString *)localizationKeyDisabled {
    return objc_getAssociatedObject(self, @selector(localizationKeyDisabled));
}

- (void)setLocalizationKeyDisabled:(NSString *)localizationKeyDisabled {
    objc_setAssociatedObject(self, @selector(localizationKeyDisabled), localizationKeyDisabled, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (localizationKeyDisabled) {
        [self setTitle:LKLocalizedString(localizationKeyDisabled, nil) forState:UIControlStateDisabled];
    }
}

- (NSString *)localizationKeyHightlighted {
    return objc_getAssociatedObject(self, @selector(localizationKeyHightlighted));
}

- (void)setLocalizationKeyHightlighted:(NSString *)localizationKeyHightlighted {
    objc_setAssociatedObject(self, @selector(localizationKeyHightlighted), localizationKeyHightlighted, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (localizationKeyHightlighted) {
        [self setTitle:LKLocalizedString(localizationKeyHightlighted, nil) forState:UIControlStateHighlighted];
    }
}

- (NSString *)localizationKeyNormal {
    return objc_getAssociatedObject(self, @selector(localizationKeyNormal));
}

- (void)setLocalizationKeyNormal:(NSString *)localizationKeyNormal {
    objc_setAssociatedObject(self, @selector(localizationKeyNormal), localizationKeyNormal, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (localizationKeyNormal) {
        [self setTitle:LKLocalizedString(localizationKeyNormal, nil) forState:UIControlStateNormal];
    }
}

- (NSString *)localizationKeySelected {
    return objc_getAssociatedObject(self, @selector(localizationKeyNormal));
}

- (void)setLocalizationKeySelected:(NSString *)localizationKeySelected {
    objc_setAssociatedObject(self, @selector(localizationKeySelected), localizationKeySelected, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (localizationKeySelected) {
        [self setTitle:LKLocalizedString(localizationKeySelected, nil) forState:UIControlStateSelected];
    }
}

#pragma mark - Localization

- (void)localize{
    if (self.isLocalized) {
        if (self.tag != -999) {
            if ([LKManager sharedInstance].currentLanguage.direction != self.controlDirection) {
                self.controlDirection = [LKManager sharedInstance].currentLanguage.direction;
                if (self.imageView.image == nil) {
                    [self flipAlignment];
                }else{
                    [self flipView];
                    [self.titleLabel flipView];
                    [self.titleLabel flipAlignment];
                }
            }
        }
        
        if (self.localizationKeyNormal) {
            [self setTitle:LKLocalizedString(self.localizationKeyNormal, nil) forState:UIControlStateNormal];
        }
        if (self.localizationKeySelected) {
            [self setTitle:LKLocalizedString(self.localizationKeySelected, nil) forState:UIControlStateSelected];
        }
        if (self.localizationKeyHightlighted) {
            [self setTitle:LKLocalizedString(self.localizationKeyHightlighted, nil) forState:UIControlStateHighlighted];
        }
        if (self.localizationKeyDisabled) {
            [self setTitle:LKLocalizedString(self.localizationKeyDisabled, nil) forState:UIControlStateDisabled];
        }
    }
}

- (void)flipAlignment{
    if (self.contentHorizontalAlignment == UIControlContentHorizontalAlignmentLeft) {
        self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    }else if(self.contentHorizontalAlignment == UIControlContentHorizontalAlignmentRight) {
        self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    }
}


@end
