 //
//  SliderCollectionView.m
//  CollectionViewTest
//
//  Created by colorful-ios on 16/6/2.
//  Copyright © 2016年 7Color. All rights reserved.
//

#import "SliderCollectionView.h"
#import "CustomCollectionLayout.h"
#import "CustomCVCell.h"

#define HEIGHT      [UIScreen mainScreen].bounds.size.height
#define WIDTH       [UIScreen mainScreen].bounds.size.width

static NSString *cellIdentifier = @"CELLIDENTIFIER";

@interface SliderCollectionView()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong)CustomCollectionLayout  *customCollectionViewLayout;

@end

@implementation SliderCollectionView

- (instancetype)initWithFrame:(CGRect)frame{
    
    _customCollectionViewLayout = [[CustomCollectionLayout alloc]init];

    if (self = [super initWithFrame:frame collectionViewLayout:_customCollectionViewLayout]) {
      
        [self configCollection];
    }
    return self;
}

- (void)configCollection{
    
    self.backgroundColor = [UIColor whiteColor];
    self.delegate    = self;
    self.dataSource  = self;
    
    [self registerClass:[CustomCVCell class] forCellWithReuseIdentifier:cellIdentifier];
}
- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CustomCVCell *customCell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    [customCell configViewTitle:@"1"];
    return customCell;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    NSInteger itemsCount = [self collectionView:collectionView numberOfItemsInSection:section];
    
    NSIndexPath *firstIndexPath = [NSIndexPath indexPathForRow:0 inSection:section];
    CGSize fistIndexPathSize    = [self collectionView:collectionView layout:collectionViewLayout sizeForItemAtIndexPath:firstIndexPath];
    
    NSIndexPath *lasttIndexPath = [NSIndexPath indexPathForRow:itemsCount-1 inSection:section];
    CGSize lastIndexPathSize    = [self collectionView:collectionView layout:collectionViewLayout sizeForItemAtIndexPath:lasttIndexPath];
    
    return UIEdgeInsetsMake(0, (collectionView.bounds.size.width - fistIndexPathSize.width)/2.0,
                            0, (collectionView.bounds.size.width - lastIndexPathSize.width)/2.0);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CGSize itemSize = _cellSize;
    return itemSize;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
