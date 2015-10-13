//
//  ViewController.m
//  贝塞尔曲线
//
//  Created by 徐章 on 15/10/13.
//  Copyright © 2015年 xuzhang. All rights reserved.
//

#import "ViewController.h"
#import "XZView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    XZView *view = [[XZView alloc] initWithFrame:self.view.frame];
    
    [self.view addSubview:view];
    

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
