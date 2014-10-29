//
//  InitializationPresenter.h
//  DemoVIPER
//
//  Created by Sherlock on 10/27/14.
//  Copyright (c) 2014 originate. All rights reserved.
//

#import "BasePresenter.h"
#import "ProgressViewInterface.h"

@interface InitializationPresenter : BasePresenter

@property (nonatomic, weak) id<ProgressViewInterface> progressView;

@end
