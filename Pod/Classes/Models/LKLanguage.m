//
//  LKLanguage.m
//
//  Created by Vlad Gorbenko on 4/21/15.
//  Copyright (c) 2015 Vlad Gorbenko. All rights reserved.
//

#import "LKLanguage.h"

@implementation LKLanguage

- (instancetype)initWithName:(NSString*)name code:(NSString*)code{
    self = [super init];
    if (self) {
        self.name = name;
        self.code = code;
        
        NSArray *rtlLanguages = @[@"ar", @"hb"];
        self.direction = [rtlLanguages containsObject:code] ? NSLocaleLanguageDirectionRightToLeft : NSLocaleLanguageDirectionLeftToRight;
    }
    return self;
}

@end
