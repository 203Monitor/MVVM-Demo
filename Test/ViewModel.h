//
//  ViewModel.h
//  Test
//
//  Created by 武国斌 on 2017/8/29.
//  Copyright © 2017年 武国斌. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Model.h"

@interface ViewModel : NSObject

@property (nonatomic, copy) NSString *userId;
@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *passWord;

@property (nonatomic, strong) Model *model;

- (instancetype)initWithModel:(Model *)model;

@end
