//
//  UITextField+Localization.h
//
//
//  Created by Vlad Gorbenko on 5/25/15.
//  Copyright (c) 2015 Vlad Gorbenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (Localization)

@property (strong, nonatomic) NSString *localizationKeyText;
@property (strong, nonatomic) NSString *localizationKeyPlaceholder;

@end
