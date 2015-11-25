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
#import "UIImageView+Localization.h"
#import "UILabel+Localization.h"
#import "UIProgressView+Localization.h"
#import "UISegmentedControl+Localization.h"
#import "UISlider+Localization.h"
#import "UISwitch+Localization.h"
#import "UITableViewCell+Localization.h"
#import "UITextField+Localization.h"
#import "UITextView+Localization.h"

extern NSString *const LKLanguageDidChangeNotification;
	
#define LocalizedTitle(keypathIdentifier) [[LKManager sharedInstance] titleForKeyPathIdentifier:keypathIdentifier]

@interface LKManager : NSObject{
    NSDictionary *_vocabluary;
}

@property (strong, nonatomic) LKLanguage *currentLanguage;
@property (strong, nonatomic) NSArray *languages;

+ (LKManager*)sharedInstance;
+ (void)nextLanguage;

- (NSString *)titleForKeyPathIdentifier:(NSString *)keyPathIdentifier;

@end
