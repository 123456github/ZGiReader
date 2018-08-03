//
//  ZGiReaderTopAndBottomBarController.m
//  ZGiReader
//
//  Created by 杨振国 on 2018/8/3.
//  Copyright © 2018年 aikutv. All rights reserved.
//

#import "ZGiReaderTopAndBottomBarController.h"
#import "ZGiReaderHeader.h"


@interface ZGiReaderTopAndBottomBarController ()
@property(nonatomic,strong)UIView * topView;
@property(nonatomic,strong)UIView * bottomView;
@property(nonatomic,assign)BOOL isShow;

@property(nonatomic,strong)UIButton * backButton;//返回按钮
@end

@implementation ZGiReaderTopAndBottomBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    
}


- (void)hiddenOrShowZGiReaderTopAndBottomBar
{
    
    [UIView animateWithDuration:ZGiReader_afterDelay animations:^{
        if (self.isShow) {
            
            self.topView.frame = CGRectMake(0, -NavigationBar_Height, K_SCREEN_WIDTH, NavigationBar_Height);
            self.bottomView.frame = CGRectMake(0, K_SCREEN_HEIGHT, K_SCREEN_WIDTH, ZGiReaderTopAndBottomBar_BottomViewHeight);
        }else{
            self.topView.frame = CGRectMake(0, 0, K_SCREEN_WIDTH, NavigationBar_Height);
            self.bottomView.frame = CGRectMake(0, K_SCREEN_HEIGHT - ZGiReaderTopAndBottomBar_BottomViewHeight, K_SCREEN_WIDTH, ZGiReaderTopAndBottomBar_BottomViewHeight);
        }
        
        self.isShow = !self.isShow;
    }];
    
}


- (void)setupUI
{
    [self.view addSubview:self.topView];
    [self.view addSubview:self.bottomView];
    
    
   
}

#pragma mark - 按钮点击事件
- (void)buttonClickWithSender:(UIButton *)sender
{
    
    NSLog(@">>>>>>>>>>>>%ld",(long)sender.tag);
    
    
}



#pragma mark - 懒加载
- (UIButton *)backButton
{
    if (!_backButton) {
        
#define button_Width 40
        _backButton = [[UIButton alloc] initWithFrame:CGRectMake(ZGiReader_edge_10, NavigationBar_Height - ZGiReader_edge_10 - button_Width, button_Width, button_Width)];
        _backButton.tag = 100;
        
        _backButton.backgroundColor = zgRc4randomColor;
    }
    return _backButton;
}


- (UIView *)topView
{
    if (!_topView) {
        _topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, K_SCREEN_WIDTH, NavigationBar_Height)];
        _topView.backgroundColor = ZGiReader_ThemeFontColor;
        // _topView.hidden = YES;
        self.isShow = YES;
        [_topView addSubview: self.backButton];
        [self.backButton addTarget:self action:@selector(buttonClickWithSender:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _topView;
}

- (UIView *)bottomView
{
    if (!_bottomView) {
        _bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, K_SCREEN_HEIGHT - ZGiReaderTopAndBottomBar_BottomViewHeight, K_SCREEN_WIDTH, ZGiReaderTopAndBottomBar_BottomViewHeight)];
        _bottomView.backgroundColor = ZGiReader_ThemeFontColor;
        // _bottomView.hidden = YES;
    }
    return _bottomView;
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
