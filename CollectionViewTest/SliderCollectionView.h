//
//  SliderCollectionView.h
//  CollectionViewTest
//
//  Created by colorful-ios on 16/6/2.
//  Copyright © 2016年 7Color. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SliderCollectionView : UICollectionView

@property (nonatomic,strong)NSArray *dataArray;

@property (nonatomic,assign)CGSize cellSize;

@property (nonatomic,assign)CGFloat transtionScale;

@end
