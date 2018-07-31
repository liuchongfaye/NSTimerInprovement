//
//  TimerViewController.m
//  NSTimerInprovement
//
//  Created by 刘冲 on 2018/7/30.
//  Copyright © 2018年 lc. All rights reserved.
//

#import "TimerViewController.h"
#import "NSTimerInprovement.h"

@interface TimerViewController ()

@property (nonatomic, strong) UILabel *timerLabel;

@property (nonatomic, strong) NSTimerInprovement *timerInprovement;

@end

@implementation TimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.backgroundColor = [UIColor greenColor];
    scrollView.contentSize = CGSizeMake(CGRectGetWidth(scrollView.frame), 2 * CGRectGetHeight(scrollView.frame));
    [self.view addSubview:scrollView];
    
    self.timerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 250.0, CGRectGetWidth(scrollView.frame), 60.0)];
    self.timerLabel.backgroundColor = [UIColor redColor];
    self.timerLabel.text = @"0";
    [scrollView addSubview:self.timerLabel];
    
//    NSMethodSignature *methodSignature = [[self class] instanceMethodSignatureForSelector:@selector(timerFire:)];
//    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSignature];
//    invocation.target = self;
//    invocation.selector = @selector(timerFire:);
//
//    NSTimer *timer = [NSTimer timerWithTimeInterval:1.0 invocation:invocation repeats:YES];
//    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0 invocation:invocation repeats:YES];
//    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerFire:) userInfo:nil repeats:YES];
//    NSTimer *timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(timerFire:) userInfo:nil repeats:YES];

    
//    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    
    NSTimerInprovement *timerInprovement = [NSTimerInprovement ns_timerWithTimeInterval:1.0 target:self selector:@selector(timerFire:) userInfo:nil repeats:YES];
    self.timerInprovement = timerInprovement;
}

- (void)dealloc {
    NSLog(@"class == %@, method = %@", [self class], NSStringFromSelector(_cmd));
}

#pragma mark - Actions

- (void)timerFire:(NSTimer *)timer {
    NSInteger count = self.timerLabel.text.integerValue + 1;
    if (count == 20) {
        [self.timerInprovement.timer invalidate];
    }    self.timerLabel.text = [NSString stringWithFormat:@"%@", @(count)];
}



@end
