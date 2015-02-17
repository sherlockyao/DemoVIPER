//
//  CommunicatePresenter.h
//  DemoVIPER
//
//  Created by Sherlock on 10/29/14.
//  Copyright (c) 2014 originate. All rights reserved.
//

#import "BasePresenter.h"
#import "ProgressViewInterface.h"
#import "MessageBoardViewInterface.h"
#import "SiriInteractor.h"

@interface CommunicatePresenter : BasePresenter <SiriInteractorDelegate>

@property (nonatomic, weak) id<ProgressViewInterface> progressView;
@property (nonatomic, weak) id<MessageBoardViewInterface> messageBoard;
@property (nonatomic, strong) SiriInteractor *siriInteractor;

- (void)wantSendMessage:(NSString *)message;

@end
