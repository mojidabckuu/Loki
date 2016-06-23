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
@property (strong, nonatomic) LKLanguage * english;
@property (strong, nonatomic) LKLanguage * arabic;

@end

@implementation LKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.english = [[LKLanguage alloc] initWithName:@"English" code:@"en" title:@"English"];
    self.arabic = [[LKLanguage alloc] initWithName:@"Ar" code:@"Arabic" title:@"Arabic"];
    
    [LKManager addLanguage:self.english];
    [LKManager addLanguage:self.arabic];
    
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
    self.currentLanguage = self.currentLanguage == self.english ? self.arabic : self.english;
}

@end
