//
//  PageMessenger.m
//  DemoVIPER
//
//  Created by Sherlock on 10/27/14.
//  Copyright (c) 2014 originate. All rights reserved.
//

#import "PageMessenger.h"

static NSString *const DefaultName = @"Default";

@interface PageMessenger ()

@property (nonatomic, strong) NSString *theName;
@property (nonatomic, strong) NSMutableDictionary *parameters;

@end

@implementation PageMessenger

- (id)init {
  self = [super init];
  if (self) {
    _parameters = [NSMutableDictionary dictionary];
  }
  return self;
}

+ (instancetype)messenger {
  return [self messengerWithName:DefaultName];
}

+ (instancetype)messengerWithName:(NSString *)name {
  PageMessenger *messenger = [PageMessenger new];
  messenger.theName = name;
  return messenger;
}

+ (NSString *)defaultName {
  return DefaultName;
}

- (void)addParam:(NSString *)name value:(id)value {
  [self.parameters setValue:value forKeyPath:name];
}

- (NSString *)name {
  return self.theName ? self.theName : DefaultName;
}

- (NSDictionary *)params {
  return [NSDictionary dictionaryWithDictionary:self.parameters];
}

@end
