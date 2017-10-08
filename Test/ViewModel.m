//
//  ViewModel.m
//  Test
//
//  Created by 武国斌 on 2017/8/29.
//  Copyright © 2017年 武国斌. All rights reserved.
//

#import "ViewModel.h"
#import "ReactiveCocoa.h"

@implementation ViewModel

- (instancetype)initWithModel:(Model *)model {
    self = [super init];
    if (self) {
        [self setModel:model];
        [self initWithModel];
    }
    return self;
}

- (void)initWithModel {
    @weakify(self);
    [RACObserve(self.model, userId) subscribeNext:^(id x) {
        @strongify(self);
        [self setUserId:x];
    }];
    
    [RACObserve(self.model, userName) subscribeNext:^(id x) {
        @strongify(self);
        [self setUserName:x];
    }];
    
    [RACObserve(self.model, passWord) subscribeNext:^(id x) {
        @strongify(self);
        [self setPassWord:x];
    }];
    
//    [RACObserve(self, userId) subscribeNext:^(id x) {
//        @strongify(self);
//        [self.model setUserId:x];
//    }];
}

@end
