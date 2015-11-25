//
//  LKManager.m
//
//  Created by Vlad Gorbenko on 4/21/15.
//  Copyright (c) 2015 Vlad Gorbenko. All rights reserved.
//

#import "LKManager.h"

#import "NSBundle+Language.h"

#define LANGUAGE_DEFAULTS_NAME @"UserPreferedAppLanguage"

NSString *const LKLanguageDidChangeNotification = @"LKLanguageDidChangeNotification";

@implementation LKManager

@synthesize currentLanguage = _currentLanguage;

#pragma - Class Methods

+ (LKManager*)sharedInstance{
    static LKManager *localizationManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        localizationManager = [[self alloc] init];
    });
    return localizationManager;
}

+ (void)nextLanguage{
    LKManager *manager = [LKManager sharedInstance];
    NSUInteger currentLanguageIndex = [manager.languages indexOfObject:manager.currentLanguage];
    currentLanguageIndex = currentLanguageIndex + 1 < manager.languages.count ? currentLanguageIndex + 1 : 0;
    manager.currentLanguage = manager.languages[currentLanguageIndex];
    
    NSLog(@"%@", manager.currentLanguage.name);
}

#pragma - Inits

- (instancetype)init{
    self = [super init];
    if (self) {
        self.languages = [self setupLanguages];
        _vocabluary = [self setupVocabluary];
    }
    return self;
}

- (NSArray*)setupLanguages{
    NSMutableArray *languages = [NSMutableArray array];
    
    [languages addObject:[[LKLanguage alloc] initWithName:@"Arabic" code:@"ar"]];
    [languages addObject:[[LKLanguage alloc] initWithName:@"English" code:@"en"]];
    
    return languages;
}

- (NSDictionary*)setupVocabluary{
    NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"Localization" ofType:@"plist"];
    return [NSDictionary dictionaryWithContentsOfFile:filePath];
}

#pragma mark - Private Methods

- (LKLanguage *)currentLanguage{
    if (!_currentLanguage) {
        NSString *currentSystemCode = [NSLocale preferredLanguages].firstObject;
        NSString *currentAppCode = [[NSUserDefaults standardUserDefaults] valueForKey:LANGUAGE_DEFAULTS_NAME];
        _currentLanguage = [self getLanguageByCode:currentAppCode ? currentAppCode : currentSystemCode];
    }
    return _currentLanguage;
}

- (void)setCurrentLanguage:(LKLanguage *)currentLanguage{
    if (currentLanguage != nil) {
        _currentLanguage = currentLanguage;
        
        [NSBundle setLanguage:currentLanguage.code];
        
        [[NSUserDefaults standardUserDefaults] setValue:_currentLanguage.code forKey:LANGUAGE_DEFAULTS_NAME];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [[NSNotificationCenter defaultCenter] postNotificationName:LKLanguageDidChangeNotification object:nil];
    }
}

- (NSString *)titleForKeyPathIdentifier:(NSString *)keyPathIdentifier preferredLanguage:(NSString *)languageCode{
    if([_vocabluary valueForKey:keyPathIdentifier]){
        return [[_vocabluary valueForKey:keyPathIdentifier] valueForKey:languageCode];
    }else{
        return [NSString stringWithFormat:@"%@", keyPathIdentifier];
    }
}

#pragma mark - Public Methods

- (LKLanguage*)getLanguageByCode:(NSString*)code{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"code = %@", code];
    return [self.languages filteredArrayUsingPredicate:predicate].firstObject;
}

- (NSString *)titleForKeyPathIdentifier:(NSString *)keyPathIdentifier{
    return [self titleForKeyPathIdentifier:keyPathIdentifier preferredLanguage:self.currentLanguage.code];
}

@end