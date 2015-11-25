//
//  LKManager.h
//
//  Created by Vlad Gorbenko on 4/21/15.
//  Copyright (c) 2015 Vlad Gorbenko. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "LKLanguage.h"

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
