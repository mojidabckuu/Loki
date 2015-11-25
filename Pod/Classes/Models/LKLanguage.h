//
//  LKLanguage.h
//
//  Created by Vlad Gorbenko on 4/21/15.
//  Copyright (c) 2015 Vlad Gorbenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LKLanguage : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *code;

@property (nonatomic) NSLocaleLanguageDirection direction;

- (instancetype)initWithName:(NSString*)name code:(NSString*)code;

@end
