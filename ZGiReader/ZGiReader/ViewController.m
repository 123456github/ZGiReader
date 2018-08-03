//
//  ViewController.m
//  ZGiReader
//
//  Created by 杨振国 on 2018/7/26.
//  Copyright © 2018年 aikutv. All rights reserved.
//

#import "ViewController.h"
#import "ZGiReaderViewController.h"
#import "ZGiReaderReadUtilites.h"
#import "JJPreventCrash.h"

@interface ViewController ()
@property(nonatomic,strong)UINavigationController * iNavigationController;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"205832" withExtension:@"txt"];
   
    
    NSString * str = [ZGiReaderReadUtilites encodeWithURL:url];//[NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
    NSArray * arr = [ZGiReaderReadUtilites encodeReturnFilterSplitContentTextWithURL:url];
    
    ZGiReaderChapterModel * model = [JJPreventCrash jjObjectWithArray:arr AndAtIndex:100];//显示第几章传入几，适用于目录
   
    ZGiReaderViewController * iReaderViewController = [ZGiReaderViewController new];
    [self addChildViewController:iReaderViewController];
    [self.view addSubview:iReaderViewController.view];
    [iReaderViewController loadText:model.chapterContent];
    
    
    
    
//    self.iNavigationController = [UINavigationController new];
//    self.iNavigationController.
//
//    [self.navigationController pushViewController:[ZGiReaderViewController new] animated:YES];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
