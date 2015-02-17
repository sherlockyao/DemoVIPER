//
//  CommunicatePresenter.m
//  DemoVIPER
//
//  Created by Sherlock on 10/29/14.
//  Copyright (c) 2014 originate. All rights reserved.
//

#import "CommunicatePresenter.h"

@implementation CommunicatePresenter

- (void)wantSendMessage:(NSString *)message {
  [self.progressView beginProgress];
  [self.siriInteractor askQuestion:message];
}

- (void)siriInteractor:(SiriInteractor *)siriInteractor didResponseToQuestion:(NSString *)question response:(NSString *)response {
  [self.progressView endProgress];
  [self.messageBoard showMessage:response];
}

@end
