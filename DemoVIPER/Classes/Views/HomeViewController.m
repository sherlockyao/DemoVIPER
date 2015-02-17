//
//  ViewController.m
//  DemoVIPER
//
//  Created by Sherlock on 10/27/14.
//  Copyright (c) 2014 originate. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (IBAction)buttonClicked:(id)sender {
  if (0 < [self.textField.text length]) {
    [self.communicatePresenter wantSendMessage:self.textField.text];
  }
}

#pragma mark - ProgressViewInterface

- (void)beginProgress {
  [self.button setTitle:@"Thinking ..." forState:UIControlStateNormal];
  [self.button setEnabled:NO];
}

- (void)endProgress {
  [self.button setTitle:@"Send to Siri" forState:UIControlStateNormal];
  [self.button setEnabled:YES];
}

#pragma mark - MessageBoardViewInterface

- (void)showMessage:(NSString *)message {
  self.textField.text = message;
}

@end
