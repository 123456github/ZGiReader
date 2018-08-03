//
//  ZGiReaderViewController.m
//  ZGiReader
//
//  Created by 杨振国 on 2018/7/26.
//  Copyright © 2018年 aikutv. All rights reserved.
//

#import "ZGiReaderViewController.h"
#import "ZGiReaderCollectionView.h"
#import "ZGiReaderCollectionViewFlowLayout.h"
#import "ZGiReaderPageCell.h"
#import "NSString+ZGiReaderPaging.h"
#import "ZGiReaderCurrentTempView.h"
#import "ZGiReaderTopAndBottomBarController.h"

#define NetworkExceptionPromptString @"获取章节失败，请尝试重新加载"//网络异常提示字符串
static NSString * cell_id = @"cellid";
@interface ZGiReaderViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UIGestureRecognizerDelegate>
@property(nonatomic,strong)ZGiReaderCollectionView * readerCollectionView;
@property (strong, nonatomic) ZGiReaderCollectionViewFlowLayout *flowLayout;
@property (nonatomic, strong) NSMutableArray *rangeArray;
@property (nonatomic, strong) NSString *chapterTextString;
@property (nonatomic, strong) ZGiReaderCurrentTempView * iReaderCurrentTempView;

@property (nonatomic, strong) ZGiReaderTopAndBottomBarController * iReaderTopAndBottomBarController;

@property(nonatomic, assign)CGPoint touchBeganPoint;
@end

@implementation ZGiReaderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    [self setupUI];
    

}

- (void)setupUI
{
    
    [self.view addSubview:self.readerCollectionView];
    // [self.view addSubview:self.iReaderCurrentTempView];
    
    UITapGestureRecognizer * tapGesRec = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(callToolBar:)];
    //tapGesRec.delegate = self;
    [self.readerCollectionView addGestureRecognizer:tapGesRec];
   // [self.view addSubview:self.iReaderTopAndBottomBar];
  //  [self addChildViewController:self.iReaderTopAndBottomBarController];
    [self.view addSubview:self.iReaderTopAndBottomBarController.view];
}

#pragma mark - 处理手势冲突

//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
//    if ([touch.view class] == [ZGiReaderPageView class]) {
//        return YES;
//    }else {
//        return NO;
//    }
//}




- (void)loadText:(NSString *)text
{
    //去除文章开头和结尾的空格和换行，防止出现空白页
    text = [text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if ([text rangeOfString:@"(null)"].location != NSNotFound) {
        text = [text stringByReplacingOccurrencesOfString:@"(null)" withString:NetworkExceptionPromptString];
    }
    
    self.chapterTextString = text;
    NSMutableDictionary * attributes = [NSMutableDictionary dictionaryWithCapacity:5];
    UIFont * font = [UIFont systemFontOfSize:20];
    [attributes setValue:font forKey:NSFontAttributeName];
    [attributes setValue:@(1.0) forKey:NSKernAttributeName];
    [attributes setValue:@(1.0) forKey:NSKernAttributeName];
    // UIColor *color = [E_CommonManager color];//颜色暂时去掉
    //[attributes setValue:color forKey:NSForegroundColorAttributeName];
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 10;//self.lineSpace;//行距
    //  paragraphStyle.paragraphSpacing = 0.0;//段距
    paragraphStyle.alignment = NSTextAlignmentJustified;
    [attributes setValue:paragraphStyle forKey:NSParagraphStyleAttributeName];
    self.attributes = [attributes copy];
    self.rangeArray = [[text paginationWithAttributes:self.attributes constrainedToSize:CGSizeMake(K_SCREEN_WIDTH - 2*offSet_x, K_SCREEN_HEIGHT - label_Height - offSet_y)] mutableCopy];
//    if (completion) {
//        completion();
//    }
    
    
//    [self.globalModel loadText:text completion:^{
////        self.collectionViewModel.text = self.globalModel.text;
////        self.collectionViewModel.attributes = self.globalModel.attributes;
////        self.collectionViewModel.dataArray = self.globalModel.rangeArray;
////        self.collectionViewModel.bgColor = self.globalModel.bgColor;
////        //   self.collectionViewModel.fontSize = self.globalModel.fontSize;
////        self.view.backgroundColor = self.globalModel.bgColor;
////        _chapterEndView.backgroundColor = self.view.backgroundColor;//[UIColor redColor];
////
////        _collectionView.backgroundColor = self.view.backgroundColor;
////        [self.collectionView reloadData];
////
////        self.modelController.text = self.globalModel.text;
////        self.modelController.attributes = self.globalModel.attributes;
////        self.modelController.pageData = self.globalModel.rangeArray;
//    }];
    
//    if (Current_ChapterIndex < 0) {
//        [self.novelTitleLabel setText:@""];
//    }else{
//        [self.novelTitleLabel setText:[NSString stringWithFormat:@"%@",[E_ReaderDataSource shareInstance].name]];
//    }
//
//
//    [self recvBcast];
//    //手机电量
//    [UIDevice currentDevice].batteryMonitoringEnabled = YES;
//    double deviceLevel = [UIDevice currentDevice].batteryLevel;
//    NSString *device = [NSString stringWithFormat:@"%.0f",deviceLevel*10];
//
//    NSString *bat = [NSString stringWithFormat:@"battery_%@",device];
//    if (Current_ChapterIndex < 0) {
//        [self.batteryImage setImage:[UIImage imageNamed:@""]];
//    }else{
//        [self.batteryImage setImage:[UIImage imageNamed:bat]];
//    }
//
//    @weakify(self);
//    [self.readerTool startMonitorTimeWithBlock:^(NSDate *currentDate) {
//        @strongify(self);
//        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//        [dateFormatter setDateFormat:@"HH:mm"];
//        NSString *datestr = [dateFormatter stringFromDate:currentDate];
//        if (Current_ChapterIndex < 0) {
//            self.timeLabel.text = @"";
//        }else{
//            self.timeLabel.text = datestr;
//        }
//
//
//    }];
//
//    //时间label
//    _timeLabel.textColor  = kTextColor;
//    //进度label
//    _progressLabel.textColor = kTextColor;
//    //小说标题label
//    _novelTitleLabel.textColor = kTextColor;
//    //章节标题label
//    _chapterTitleLabel.textColor = kTextColor;
    
}

#pragma mark - 数据源
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.rangeArray.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZGiReaderPageCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:cell_id forIndexPath:indexPath];
    
    
    NSString *subText = [self.chapterTextString substringWithRange:NSRangeFromString(self.rangeArray[indexPath.row])];
    [cell.pageView setText:[[NSAttributedString alloc] initWithString:subText attributes:self.attributes]];
    
    

    [self.iReaderCurrentTempView.pageView setText:[[NSAttributedString alloc] initWithString:subText attributes:self.attributes]];
    
    cell.contentView.backgroundColor = ZGiReader_backgroundColor;
    return cell;
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}


#pragma mark - 手势
#pragma mark - 自定义手势
- (void)callToolBar:(UITapGestureRecognizer *)tap{
    CGPoint startP = [tap locationInView:self.view];
    
 
    [self showOrHiddenIReaderTopAndBottomBarControllerViewWithPoint:startP];
    
    NSLog(@"开始(%f,%f)",startP.x,startP.y);
}


/**
 展示或隐藏设置栏
 @param point 手势坐标
 */
- (void)showOrHiddenIReaderTopAndBottomBarControllerViewWithPoint:(CGPoint)point
{
    if (point.x < K_SCREEN_WIDTH*2/3 && point.x > K_SCREEN_WIDTH/3 &&point.y < K_SCREEN_HEIGHT*2/3 && point.y > K_SCREEN_HEIGHT/3) {
        
        [self.iReaderTopAndBottomBarController hiddenOrShowZGiReaderTopAndBottomBar];
        if (self.iReaderTopAndBottomBarController.view.superview == self.view) {
            [self performSelector:@selector(iReaderTopAndBottomBarControllerViewRemoveFromSuperView) withObject:self afterDelay:ZGiReader_afterDelay];
        }else{
            [self.view addSubview:self.iReaderTopAndBottomBarController.view];
        }
    }
}

- (void)iReaderTopAndBottomBarControllerViewRemoveFromSuperView
{
    [self.iReaderTopAndBottomBarController.view removeFromSuperview];
}

// 根据touches集合获取对应的触摸点
- (CGPoint)pointWithTouches:(NSSet *)touches
{
    UITouch *touch = [touches anyObject];

    return [touch locationInView:self.view];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CGPoint startP = [self pointWithTouches:touches];
    NSLog(@"开始(%f,%f)",startP.x,startP.y);
    
   // CGPoint startP = [tap locationInView:self.view];
    
    [self showOrHiddenIReaderTopAndBottomBarControllerViewWithPoint:startP];
    
    if ([event allTouches].count == 1) {


    }
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    // 获取移动点
    CGPoint moveP = [self pointWithTouches:touches];
    NSLog(@"正在画(%f,%f)",moveP.x,moveP.y);
    if ([event allTouches].count > 1){

    }else if ([event allTouches].count == 1) {

    }


}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"画完");
    if ([event allTouches].count > 1){
     //   [self.superview touchesMoved:touches withEvent:event];
    }
}

- (void) didTurnPageBackward {
//    _interactionLocked = NO;
//    [self didTurnToPageAtIndex:_currentPageIndex];
}

- (void) didTurnPageForward {
//    _interactionLocked = NO;
//    self.currentPageIndex = self.currentPageIndex + _numberOfVisiblePages;
//    [self didTurnToPageAtIndex:_currentPageIndex];
}






#pragma mark - 懒加载
- (ZGiReaderTopAndBottomBarController *)iReaderTopAndBottomBarController
{
    if (!_iReaderTopAndBottomBarController) {
        _iReaderTopAndBottomBarController = [[ZGiReaderTopAndBottomBarController alloc] init];
    }
    return _iReaderTopAndBottomBarController;
}




- (ZGiReaderCurrentTempView *)iReaderCurrentTempView
{
    if (!_iReaderCurrentTempView) {
        _iReaderCurrentTempView = [[ZGiReaderCurrentTempView alloc] initWithFrame:self.view.bounds];
        //[self.view addSubview:_iReaderCurrentTempView];
      //  _iReaderCurrentTempView.hidden = YES;
    }
    _iReaderCurrentTempView.backgroundColor = ZGiReader_backgroundColor;
    return _iReaderCurrentTempView;
}
- (ZGiReaderCollectionViewFlowLayout *)flowLayout
{
    if (!_flowLayout) {
        _flowLayout = [[ZGiReaderCollectionViewFlowLayout alloc] init];
    }
    return _flowLayout;
}
- (UICollectionView *)readerCollectionView
{
    if (!_readerCollectionView) {
        ZGiReaderCollectionView * readerCollectionView = [[ZGiReaderCollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:self.flowLayout];
        _readerCollectionView = readerCollectionView;
        _readerCollectionView.backgroundColor = ZGiReader_backgroundColor;//[UIColor redColor];
        _readerCollectionView.dataSource = self;
        _readerCollectionView.delegate = self;
        [_readerCollectionView registerClass:[ZGiReaderPageCell class] forCellWithReuseIdentifier:cell_id];
        _readerCollectionView.pagingEnabled = YES;
    }
    
    return _readerCollectionView;
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
- (NSDictionary *)attributes
{
    if (!_attributes) {
        NSMutableDictionary * attributes = [NSMutableDictionary dictionaryWithCapacity:5];
        UIFont * font = [UIFont systemFontOfSize:15];
        [attributes setValue:font forKey:NSFontAttributeName];
        [attributes setValue:@(1.0) forKey:NSKernAttributeName];
        [attributes setValue:@(1.0) forKey:NSKernAttributeName];
        UIColor *color = ZGiReader_ContentFontColor;//[E_CommonManager color];
        [attributes setValue:color forKey:NSForegroundColorAttributeName];
        NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineSpacing = 20;//self.lineSpace;//行距
        //  paragraphStyle.paragraphSpacing = 0.0;//段距
        paragraphStyle.alignment = NSTextAlignmentJustified;
        [attributes setValue:paragraphStyle forKey:NSParagraphStyleAttributeName];
        _attributes = [attributes copy];
    }
    return _attributes;
}

@end
