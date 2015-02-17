//
//  PageMessenger.m
//  DemoVIPER
//
//  Created by Sherlock on 10/27/14.
//  Copyright (c) 2014 originate. All rights reserved.
//

#import "PageMessenger.h"
#import "Config.h"

@interface PageMessenger ()

@property (readwrite, nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSMutableDictionary *parameters;

@end

@implementation PageMessenger

- (id)init {
  self = [super init];
  if (self) {
    _name = PageMessengerNameDefault;
    _parameters = [NSMutableDictionary dictionary];
  }
  return self;
}

+ (instancetype)messenger {
  return [PageMessenger new];
}

+ (instancetype)messengerWithName:(NSString *)name {
  PageMessenger *messenger = [PageMessenger new];
  messenger.name = name;
  return messenger;
}

- (NSDictionary *)params {
  return [NSDictionary dictionaryWithDictionary:self.parameters];
}

- (void)addParam:(NSString *)name value:(id)value {
  [self.parameters setValue:value forKeyPath:name];
}

@end
