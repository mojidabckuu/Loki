//
//  LKManager.h
//
//  Created by Vlad Gorbenko on 4/21/15.
//  Copyright (c) 2015 Vlad Gorbenko. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "LKLanguage.h"

#import "UIView+Localization.h"
#import "UIButton+Localization.h"

#import "UILabel+Localization.h"

#import "UISegmentedControl+Localization.h"

#import "UITextField+Localization.h"
#import "UITextView+Localization.h"

extern NSString *const LKLanguageDidChangeNotification;

NSString *LKLocalizedString(NSString *key, NSString *comment);

@interface LKManager : NSObject{
    NSDictionary *_vocabluary;
}

@property (nonatomic, strong) LKLanguage *currentLanguage;
@property (nonatomic, readonly) NSArray *languages;

+ (void)setLocalizationFilename:(NSString *)localizationFilename;

+ (LKManager*)sharedInstance;
+ (void)nextLanguage;

- (NSString *)titleForKeyPathIdentifier:(NSString *)keyPathIdentifier;

+ (NSMutableArray *)simpleViews;

+ (void)addLanguage:(LKLanguage *)language;
+ (void)removeLanguage:(LKLanguage *)language;

@end
