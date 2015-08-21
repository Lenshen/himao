//
//  FirstViewController.m
//  himao
//
//  Created by 远深 on 15/8/14.
//  Copyright (c) 2015年 bao. All rights reserved.
//

#import "FirstViewController.h"
#define imageHight 150.f
//首页
@interface FirstViewController ()<UIScrollViewDelegate>
{
    BOOL isFromStart;
}
@property (weak, nonatomic) IBOutlet UIScrollView *superScroller;
@property (weak, nonatomic) IBOutlet UIScrollView *haiBaoScrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControlShouYe;
@property (strong, nonatomic) UIImageView *zoomImage;
@property (strong, nonatomic) NSTimer *mytimer;
@property (nonatomic) int page;

@end

@implementation FirstViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.superScroller.contentSize =  CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height+174);
    
    
    //scrollview会停在页面之间。如果yes只会显示第一页和第二页
    self.superScroller.pagingEnabled = NO;
//    self.superScroller.bounces = NO;
    self.zoomImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"1"]];
    self.zoomImage.frame = CGRectMake(0, -imageHight, self.view.bounds.size.width, imageHight);
    self.zoomImage.contentMode = UIViewContentModeScaleAspectFill;
    self.superScroller.delegate = self;
    [self.superScroller addSubview:_zoomImage];
    self.superScroller.contentInset = UIEdgeInsetsMake(imageHight, 0, 0, 0);
    
    [self addPagecontrollAndTiemer];
    
}
-(void)addPagecontrollAndTiemer
{
    
    
    
    self.haiBaoScrollView.contentSize = CGSizeMake(self.view.frame.size.width*3, self.haiBaoScrollView.frame.size.height);
    self.haiBaoScrollView.pagingEnabled = YES;
    [self.pageControlShouYe addTarget:self action:@selector(pageTurn) forControlEvents:UIControlEventValueChanged];
    self.mytimer = [NSTimer scheduledTimerWithTimeInterval:10.f target:self selector:@selector(scrollToNextPage:) userInfo:nil repeats:YES];
}
-(void)scrollToNextPage:(id)sender
{
    ++self.pageControlShouYe.currentPage;
    
    CGFloat pageWith = CGRectGetWidth(self.haiBaoScrollView.frame);
    if (isFromStart) {
        [self.haiBaoScrollView setContentOffset:CGPointMake(0, 0)animated:YES];
       self.pageControlShouYe.currentPage = 0;
    }else
    {
        [self.haiBaoScrollView setContentOffset:CGPointMake(pageWith * self.pageControlShouYe.currentPage, self.haiBaoScrollView.bounds.origin.y)];
       
        
    }
    if (_pageControlShouYe.currentPage == _pageControlShouYe.numberOfPages-1) {
        isFromStart = YES;
    }else
    {
        isFromStart = NO;
    }
    NSLog(@"%ld",self.pageControlShouYe.currentPage);
    
   
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat y = self.superScroller.contentOffset.y;
    if (y < -imageHight) {
        CGRect frame = self.zoomImage.frame;
        frame.origin.y  = y;
        frame.size.height = -y;
        self.zoomImage.frame = frame;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
