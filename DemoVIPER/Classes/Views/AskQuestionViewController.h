//
//  AskQuestionViewController.h
//  DemoVIPER
//
//  Created by Sherlock on 2/17/15.
//  Copyright (c) 2015 originate. All rights reserved.
//

#import "BaseViewController.h"
#import "AskQuestionPanelPresenter.h"

@interface AskQuestionViewController : BaseViewController

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicatorView;
@property (weak, nonatomic) IBOutlet UITextField *questionTextField;
@property (weak, nonatomic) IBOutlet UITableView *questionsTableView;
@property (weak, nonatomic) IBOutlet UIView *answerBoardView;
@property (weak, nonatomic) IBOutlet UIImageView *emojiImageView;
@property (weak, nonatomic) IBOutlet UILabel *answerLabel;

@property (nonatomic, strong) AskQuestionPanelPresenter *askQuestionPanelPresenter;

@end
