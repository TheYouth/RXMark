//
//  EMDiaryVC.m
//  RXEMark
//
//  Created by 星仔 on 2018/8/20.
//  Copyright © 2018年 pingan. All rights reserved.
//

#import "RXDiaryVC.h"
#import "RXDiaryTableViewCell.h"
#import "RXDiaryNoPicTableViewCell.h"
#import "RXDiaryInfoModel.h"
#import "MJRefresh.h"
#import "EMTheme.h"
#import "RXPublicDiaryVC.h"
#import "RXBaseNavVC.h"
#import "RXMaskView.h"
#import "UIView+EMTips.h"
#import "RXDiaryManager.h"

static NSString *RXDiaryTableViewCellIdentif = @"RXDiaryTableViewCellIdentif";
static NSString *RXDiaryNoPicTableViewCellIdentif = @"RXDiaryNoPicTableViewCellIdentif";
@interface RXDiaryVC ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView      *tableView;
@property (nonatomic, strong) NSArray          *diaryInfos;
@property (nonatomic, strong) UIButton         *publishBtn;
@property (nonatomic, strong) MJRefreshAutoNormalFooter  *refreshFooter;
@property (nonatomic, strong) RXMaskView       *maskView;



@end

@implementation RXDiaryVC
#pragma mark - ♻️life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshList:) name:nil object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshPage) name:nil object:nil];
    [self initUI];
    [self loadData];
}
- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
#pragma mark - 🔒private
- (void)initUI{
    self.title = NSLocalizedString(@"日记", nil);
    UIBarButtonItem *pubItem = [[UIBarButtonItem alloc] initWithCustomView:self.publishBtn];
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceItem.width = -5;
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:spaceItem,pubItem, nil];
    [self.view addSubview:self.tableView];
    _tableView.mj_footer = self.refreshFooter;
}
- (void)loadData{
    [self.view showMaskLoadingTips:nil style:kLogoLoopWhite];
    [[RXDiaryManager shareManager] fetchDiaryInfosWithStartIndex:((RXDiaryInfoModel *)self.diaryInfos.lastObject).diaryId
                                                      totalCount:10
                                                          result:^(RXResult *result) {
                                                              
                                                          }];
}
- (void)loadMoreData{
    
}
#pragma mark - 🚪public
#pragma mark - UITableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.diaryInfos.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.diaryInfos.count > indexPath.row) {
        RXDiaryInfoModel *diaryInfo = self.diaryInfos[indexPath.row];
        if (diaryInfo.diaryImage) {
            RXDiaryTableViewCell *diaryCell = [tableView dequeueReusableCellWithIdentifier:RXDiaryTableViewCellIdentif forIndexPath:indexPath];
            return diaryCell;
        }else{
            RXDiaryNoPicTableViewCell *diaryPicCell = [tableView dequeueReusableCellWithIdentifier:RXDiaryNoPicTableViewCellIdentif forIndexPath:indexPath];
            return diaryPicCell;
        }
    }else{
        static NSString*identif = @"RXDiaryUITableViewCell";
        UITableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:identif];
        if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identif];
        }
        return cell;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.diaryInfos && self.diaryInfos.count > indexPath.row) {
        RXDiaryInfoModel *infoM = self.diaryInfos[indexPath.row];
        if (infoM.diaryImage) {
            return 105;
        }else{
            return 75;
        }
    }
    return 0.01;
}
#pragma mark - 🔄overwrite
#pragma mark - ☎️notification
- (void)refreshList:(NSNotification *)noti{

}
- (void)refreshPage{
    
}
#pragma mark - 🎬event response
- (void)publishDiary{
    RXPublicDiaryVC *publicDiaryVC = [[RXPublicDiaryVC alloc] init];
    RXBaseNavVC *baseNavVC = [[RXBaseNavVC alloc] initWithRootViewController:publicDiaryVC];
    [self.navigationController presentViewController:baseNavVC animated:YES completion:nil];
}
#pragma mark - ☸getter and setter
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.backgroundColor = [UIColor whiteColor];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:RXDiaryTableViewCellIdentif];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:RXDiaryNoPicTableViewCellIdentif];
        UIView *footV = [UIView new];
        footV.backgroundColor = [UIColor clearColor];
        _tableView.tableFooterView = footV;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}
- (UIButton *)publishBtn{
    if (!_publishBtn) {
        _publishBtn  = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 64, 64)];
        [_publishBtn setImage:[UIImage imageNamed:@"publishDiary"] forState:UIControlStateNormal];
        [_publishBtn addTarget:self action:@selector(publishDiary) forControlEvents:UIControlEventTouchUpInside];
    }
    return _publishBtn;
}
- (RXMaskView *)maskView{
    if (!_maskView) {
        _maskView = [[RXMaskView alloc] init];
    }
    return _maskView;
}
- (MJRefreshAutoNormalFooter *)refreshFooter{
    if (!_refreshFooter) {
        __weak typeof(self)weakSelf = self;
        _refreshFooter = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            [weakSelf loadMoreData];
        }];
        [_refreshFooter setTitle:NSLocalizedString(@"点击或上拉加载更多", nil)  forState:MJRefreshStateIdle];
        [_refreshFooter setTitle:NSLocalizedString(@"正在玩命加载...", nil) forState:MJRefreshStatePulling];
        [_refreshFooter setTitle:NSLocalizedString(@"没有更多了", nil) forState:MJRefreshStateNoMoreData];
        _refreshFooter.stateLabel.font = [UIFont systemFontOfSize:15];
        _refreshFooter.stateLabel.textColor = UIColorFromHexRGB(0x999999);
        [_refreshFooter setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    }
    return _refreshFooter;
}
@end
