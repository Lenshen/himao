//
//  ViewController.m
//  himao
//
//  Created by 远深 on 15/8/14.
//  Copyright (c) 2015年 bao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *startScrollView;
@property (nonatomic )CGRect rect;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.rect = self.view.frame;
   
    self.navigationItem.title = @"蜗牛校园";
   
    
    

}


-(void)viewDidAppear:(BOOL)animated
{
    
    [super viewDidAppear:YES];

    
   

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
