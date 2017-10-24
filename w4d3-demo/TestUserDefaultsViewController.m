//
//  TestUserDefaultsViewController.m
//  w4d3-demo
//
//  Created by Roland Tecson on 2017-10-24.
//  Copyright © 2017 Roland Tecson. All rights reserved.
//

#import "TestUserDefaultsViewController.h"

@interface TestUserDefaultsViewController ()

// IBOutlets
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *highScoreTextField;

@end

@implementation TestUserDefaultsViewController

// MARK: - UIViewController methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self loadUserPreferences];
}

// MARK: - IBActions

- (IBAction)dismissButtonTapped:(UIButton *)sender
{
    [self dismissKeyboard];
}

- (IBAction)saveButtonTapped:(UIButton *)sender
{
    [self saveUserPreferences];
    [self dismissKeyboard];
}

// MARK: - Private methods

- (void)dismissKeyboard
{
    [self.view endEditing:YES];
}

- (void)loadUserPreferences
{
    self.nameTextField.text = [[NSUserDefaults standardUserDefaults] stringForKey:@"username"];
    self.highScoreTextField.text = [[NSUserDefaults standardUserDefaults] stringForKey:@"highScore"];
}

- (void)saveUserPreferences
{
    NSString *newNameValue = @"";
    if (self.nameTextField.text.length > 0) {
        newNameValue = self.nameTextField.text;
    }
    [[NSUserDefaults standardUserDefaults] setValue:newNameValue
                                             forKey:@"username"];
    NSString *newHighScoreValue = @"";
    if (self.highScoreTextField.text.length > 0) {
        newHighScoreValue = self.highScoreTextField.text;
    }
    [[NSUserDefaults standardUserDefaults] setValue:newHighScoreValue
                                             forKey:@"highScore"];
}

@end
