//
//  ViewController.h
//  DemoVIPER
//
//  Created by Sherlock on 10/27/14.
//  Copyright (c) 2014 originate. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "CommunicatePresenter.h"

@interface HomeViewController : BaseViewController<ProgressViewInterface, MessageBoardViewInterface>

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIButton *button;

@property (nonatomic, strong) CommunicatePresenter *communicatePresenter;

@end

