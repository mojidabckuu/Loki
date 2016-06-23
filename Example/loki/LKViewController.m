//
//  LKViewController.m
//  Loki
//
//  Created by mojidabckuu on 11/25/2015.
//  Copyright (c) 2015 mojidabckuu. All rights reserved.
//

#import "LKViewController.h"

@import Loki;

@interface LKViewController ()

@property (strong, nonatomic) LKLanguage * currentLanguage;

@end

@implementation LKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(languageDidChange:) name:LKLanguageDidChangeNotification object:nil];
}

#pragma mark - Setters

- (void)setCurrentLanguage:(LKLanguage *)currentLanguage {
    _currentLanguage = currentLanguage;
    [LKManager sharedInstance].currentLanguage = _currentLanguage;
}

#pragma mark - Utils

- (void)languageDidChange:(NSNotification*)notification {
    [self.view localizeSubviews];
    [self.navigationController.navigationBar localizeSubviews];
}

- (IBAction)changeLanguage:(id)sender {
    self.currentLanguage = [[LKManager sharedInstance].currentLanguage.code isEqualToString:@"en"] ? [LKManager sharedInstance].languages.lastObject : [LKManager sharedInstance].languages.firstObject;
}

@end
