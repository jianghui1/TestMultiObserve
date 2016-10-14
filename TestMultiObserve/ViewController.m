//
//  ViewController.m
//  TestMultiObserve
//
//  Created by ys on 16/5/6.
//  Copyright © 2016年 jzh. All rights reserved.
//

#import "ViewController.h"

#import "AViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AViewController *aV = [[AViewController alloc] init];
    aV.view.backgroundColor = [UIColor yellowColor];
    [aV addObserver:self forKeyPath:@"progress" options:NSKeyValueObservingOptionNew context:nil];
    [self.view addSubview:aV.view];
    [self addChildViewController:aV];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    NSLog(@"%f", [change[@"new"] floatValue]);
}

- (void)dealloc
{
    [self removeObserver:self forKeyPath:@"progress"];
}

@end
