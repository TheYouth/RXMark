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

static NSString *RXDiaryTableViewCellIdentif = @"RXDiaryTableViewCellIdentif";
static NSString *RXDiaryNoPicTableViewCellIdentif = @"RXDiaryNoPicTableViewCellIdentif";
@interface RXDiaryVC ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView      *tableView;
@property (nonatomic, strong) NSArray          *diaryInfos;
@end

@implementation RXDiaryVC
#pragma mark - ♻️life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initUI];
    [self loadData];
}
- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
#pragma mark - 🔒private
- (void)initUI{
    
    [self.view addSubview:self.tableView];
}
- (void)loadData{
    
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
#pragma mark - 🔄overwrite
#pragma mark - ☎️notification
#pragma mark - 🎬event response
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


@end
