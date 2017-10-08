//
//  ViewController.m
//  Test
//
//  Created by 武国斌 on 2017/8/28.
//  Copyright © 2017年 武国斌. All rights reserved.
//

#import "ViewController.h"
#import "ReactiveCocoa.h"

#define kWIDTH [UIScreen mainScreen].bounds.size.width
#define kHEIGHT [UIScreen mainScreen].bounds.size.height;

@interface ViewController ()

@property (nonatomic, strong) UILabel *showLabel;
@property (nonatomic, strong) UIButton *changeButton;

@end

@implementation ViewController

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    ViewController *viewController = [super allocWithZone:zone];
    
//    [[viewController rac_signalForSelector:@selector(viewDidLoad)] subscribeNext:^(id x) {
//        NSLog(@"viewDidLoad__");
//    }];
//    
//    [[viewController rac_signalForSelector:@selector(viewWillAppear:)] subscribeNext:^(id x) {
//        NSLog(@"viewWillAppear__");
//    }];
    
    return viewController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self initWithModel];
    [self changeButton];
    [self.showLabel setText:self.viewModel.userId];
}

- (UILabel *)showLabel {
    if (!_showLabel) {
        _showLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, kWIDTH - 40, 50)];
        [_showLabel setTextAlignment:NSTextAlignmentCenter];
        [self.view addSubview:_showLabel];
    }
    return _showLabel;
}

- (UIButton *)changeButton {
    if (!_changeButton) {
        _changeButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_changeButton setFrame:CGRectMake(20, 300, kWIDTH - 40, 50)];
        [_changeButton setTitle:@"change" forState:UIControlStateNormal];
        [_changeButton addTarget:self action:@selector(change) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_changeButton];
    }
    return _changeButton;
}

- (void)change {
    [self.showLabel setText:@"12345"];
}

- (void)initWithModel {
    @weakify(self);
    [RACObserve(self.viewModel, userId) subscribeNext:^(id x) {
        @strongify(self);
        [self.showLabel setText:x];
    }];
    
//    [RACObserve(self.showLabel, text) subscribeNext:^(id x) {
//        @strongify(self);
//        [self.viewModel setUserId:x];
//    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
