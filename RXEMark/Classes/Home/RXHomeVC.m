//
//  RXHomeVC.m
//  RXEMark
//
//  Created by 星仔 on 2018/8/8.
//  Copyright © 2018年 pingan. All rights reserved.
//

#import "RXHomeVC.h"
#import "EMTheme.h"
#import "RXHomeCollectionViewCell.h"
#import "RXDiaryVC.h"
#import "RXSettingVC.h"
#import "RXAlertVC.h"
#import "RXBillVC.h"
#import "RXBigDayVC.h"
#import "RXPlaceVC.h"

static NSString *rxHomeCollectionViewCell = @"RXHomeCollectionViewCell";
static NSString *rxHomeHeaderReuseableView = @"rxHomeHeaderReuseableView";
@interface RXHomeVC ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView       *collectionView;
@property (nonatomic, strong) NSArray                *mrArr;


@end

@implementation RXHomeVC
#pragma mark - ♻️life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [EMTheme shareTheme].mainBGColor;
    [self.view addSubview:self.collectionView];
}
#pragma mark - 🔒private
#pragma mark - 🚪public
#pragma mark - UICollectionView
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.mrArr.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    RXHomeCollectionViewCell *homeCell = [collectionView dequeueReusableCellWithReuseIdentifier:rxHomeCollectionViewCell forIndexPath:indexPath];
    if (self.mrArr.count > indexPath.row) {
        [homeCell updateCellWithTitle:self.mrArr[indexPath.row]];
    }
    return homeCell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:case 3:case 4:
           return CGSizeMake((self.view.frame.size.width - 50) / 2 + 50, 120);
            break;
        case 1:case 2:case 5:
            return CGSizeMake((self.view.frame.size.width-50)/2-50, 120);
        default:
            break;
    }
    return CGSizeZero;
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 20, 0, 20);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    CGFloat height = ([UIApplication sharedApplication].delegate.window.bounds.size.height - 120 * 3 - 10 * 2) / 2 - 64;
    if (IS_3_5_INCH) {
        height = ([UIApplication sharedApplication].delegate.window.bounds.size.height - 120 * 3 - 10 * 2) / 2;
    }
    return CGSizeMake(self.view.frame.size.width, height);
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:rxHomeHeaderReuseableView forIndexPath:indexPath];
    reusableView.backgroundColor = [EMTheme shareTheme].navBarBGColor;
    return reusableView;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    [self jumpCollectionViewIndexPath:indexPath];
}
#pragma mark - 🎬event response
- (void)jumpCollectionViewIndexPath:(NSIndexPath *)indexPath{
    if (self.mrArr.count > indexPath.row) {
        NSString *metuTitle = self.mrArr[indexPath.row];
        UIViewController *vc = nil;
        if ([metuTitle isEqualToString:NSLocalizedString(@"日记", nil)]) {
            vc = [RXDiaryVC new];
        } else if ([metuTitle isEqualToString:NSLocalizedString(@"账单", nil)]) {
            vc = [RXBillVC new];
        } else if ([metuTitle isEqualToString:NSLocalizedString(@"节日", nil)]) {
            vc = [RXBigDayVC new];
        } else if ([metuTitle isEqualToString:NSLocalizedString(@"收纳", nil)]) {
            vc = [RXPlaceVC new];
        } else if ([metuTitle isEqualToString:NSLocalizedString(@"提醒", nil)]) {
            vc = [RXAlertVC new];
        } else if ([metuTitle isEqualToString:NSLocalizedString(@"设置", nil)]) {
            vc = [RXSettingVC new];
        }
        
        [self.navigationController pushViewController:vc animated:YES];
    }
}
#pragma mark - ☸getter and setter
- (UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [_collectionView registerClass:[RXHomeCollectionViewCell class] forCellWithReuseIdentifier:rxHomeCollectionViewCell];
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:rxHomeHeaderReuseableView];
        _collectionView.backgroundColor = [EMTheme shareTheme].navBarBGColor;
    }
    return _collectionView;
}
- (NSArray *)mrArr{
    if (!_mrArr) {
        _mrArr = @[NSLocalizedString(@"日记", nil), NSLocalizedString(@"账单", nil), NSLocalizedString(@"节日", nil), NSLocalizedString(@"收纳", nil), NSLocalizedString(@"提醒", nil), NSLocalizedString(@"设置", nil)];
    }
    return _mrArr;
}

@end
