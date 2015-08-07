//
//  ViewController.m
//  TextKitDemo
//
//  Created by azure on 15/8/7.
//  Copyright (c) 2015年 Azureland. All rights reserved.
//

#import "ViewController.h"
#import "ILAttributedStringGenerator.h"
#import "StrHeight.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 站点名
    NSArray *lines = @[@"上沙", @"国贸", @"腾讯大厦", @"和平里", @"中油大厦", @"海王大厦", @"天利中央广场", @"南头检查站",
                       @"购物公园", @"西乡汽车站"];
    
    // 通过
    // [[ILAttributedStringGenerator sharedGenerator] generateAttributedStringWithArray:lines]
    // 生成 attributedString
    NSAttributedString *string = [[ILAttributedStringGenerator sharedGenerator] generateAttributedStringWithArray:lines];
    
    // 初始化label, 高度要动态计算, F是字体大小
    CGFloat height = [StrHeight getTextHeight:string.string W:self.view.frame.size.width F:17];
    NSLog(@"height is %@", @(height));

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, height)];
    [label setAttributedText:string];
    [label setFont:[UIFont fontWithName:@"Helvetica Neue" size:17]];
    [label setNumberOfLines:0];
    [label setLineBreakMode:NSLineBreakByWordWrapping];

    [self.view addSubview:label];
    
    label.center = self.view.center;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
