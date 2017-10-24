//
//  TestFilesViewController.m
//  w4d3-demo
//
//  Created by Roland Tecson on 2017-10-24.
//  Copyright © 2017 Roland Tecson. All rights reserved.
//

#import "TestFilesViewController.h"

@interface TestFilesViewController ()

// IBOutlets
@property (weak, nonatomic) IBOutlet UITextView *textView;

// Private properties
@property (strong, nonatomic, readonly) NSString *filePath;

@end

@implementation TestFilesViewController

// MARK: - UIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self loadFile];
}

// MARK: - IBActions

- (IBAction)loadButtonTapped:(UIButton *)sender
{
    [self loadFile];
    [self dismissKeyboard];
}

- (IBAction)saveButtonTapped:(UIButton *)sender
{
    [self saveFile];
    [self dismissKeyboard];
}

- (IBAction)dismissButtonTapped:(UIButton *)sender
{
    [self dismissKeyboard];
}

// MARK: - Getter methods

@synthesize filePath = _filePath;  // Synthesize instance variable for read-only property

- (NSString *)filePath
{
    if (_filePath == nil) {
        // Get user's documents directory
        NSArray *directories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                                   NSUserDomainMask,
                                                                   YES);
        NSString *documentsPath = [directories firstObject];
        
        // Generate filepath of file
        NSString *filePath = [documentsPath stringByAppendingPathComponent:@"myFile"];
        _filePath = filePath;
    }

    return _filePath;
}

// MARK: - Private methods

- (void)dismissKeyboard
{
    [self.textView resignFirstResponder];
}

- (void)loadFile
{
    NSFileManager* fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:self.filePath]) {
        // File exists, load it
        NSString *fileContent = [NSString stringWithContentsOfFile:self.filePath
                                                          encoding:NSUTF8StringEncoding
                                                             error:nil];
        self.textView.text = fileContent;
    }
    else {
        // File does not exist, blank out text view
        self.textView.text = @"";
    }
}

- (void)saveFile
{
    NSFileManager* fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:self.filePath]) {
        NSError *error;
        BOOL success = [fileManager removeItemAtPath:self.filePath
                                               error:&error];
        if (!success) {
            NSLog(@"Could not delete file %@:%@ ", self.filePath, [error localizedDescription]);
            return;
        }
    }
    
    if (self.textView.text.length > 0) {
        NSError *error;
        BOOL success = [self.textView.text writeToFile:self.filePath
                                            atomically:YES
                                              encoding:NSUTF8StringEncoding
                                                 error:&error];
        if (!success) {
            NSLog(@"Could not write to file %@:%@ ", self.filePath, [error localizedDescription]);
            return;
        }
    }
}

@end
