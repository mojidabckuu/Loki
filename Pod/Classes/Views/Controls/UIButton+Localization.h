//
//  UIButton+Localization.h
//
//
//  Created by Vlad Gorbenko on 5/25/15.
//  Copyright (c) 2015 Vlad Gorbenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Localization)

@property (nonatomic, strong) NSString *localizedTitleKey;

@property (strong, nonatomic) NSString *localizationKeySelected;
@property (strong, nonatomic) NSString *localizationKeyHightlighted;
@property (strong, nonatomic) NSString *localizationKeyDisabled;

@end
