//
//  CustomCollectionLayout.m
//  CollectionViewTest
//
//  Created by colorful-ios on 16/6/1.
//  Copyright © 2016年 7Color. All rights reserved.
//

#import "CustomCollectionLayout.h"

#define CELLWIDTH            ([UIScreen mainScreen].bounds.size.width - 20)/2

#define TRANSTION_DISTANCE   80

#define TRANSTION_SCALE      0.3

@implementation CustomCollectionLayout

- (instancetype)init{
    if (self = [super init]) {
        self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        self.minimumLineSpacing = 20;
        self.minimumInteritemSpacing = 20;
//        CGSize itemSize = {CELLWIDTH,CELLWIDTH};
//        self.itemSize = itemSize;
    }
    return self;
}
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    

    NSArray *array = [[NSArray alloc]initWithArray:[super layoutAttributesForElementsInRect:rect] copyItems:YES];
   
    CGRect visibleRect = (CGRect){self.collectionView.contentOffset,self.collectionView.bounds.size};

    for (UICollectionViewLayoutAttributes *collectionLayoutAttribute in array) {
        
        if (CGRectIntersectsRect(collectionLayoutAttribute.frame, rect)) {
           
            collectionLayoutAttribute.alpha = 0.5;
            
            CGFloat distance      = CGRectGetMidX(visibleRect) - collectionLayoutAttribute.center.x;
            CGFloat scaleDistance = distance/TRANSTION_DISTANCE;

            if (ABS(distance)<TRANSTION_DISTANCE) {
                
                CGFloat zoom = 1 + TRANSTION_SCALE * (1 - ABS(scaleDistance));

                collectionLayoutAttribute.transform3D   = CATransform3DMakeScale(zoom, zoom, 1.0);
                collectionLayoutAttribute.zIndex        = 1;
                collectionLayoutAttribute.alpha         = 1.0;
            }
            
        }
        
    }
    
    return array;
}

#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Wmismatched-parameter-types"

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity {

    CGFloat offsetAdjustment = MAXFLOAT;

    CGFloat centerX = proposedContentOffset.x + (CGRectGetWidth(self.collectionView.bounds) / 2.0);

    
    CGRect targetRect = CGRectMake(proposedContentOffset.x, 0.0, self.collectionView.bounds.size.width, self.collectionView.bounds.size.height);
    
    NSArray *array = [super layoutAttributesForElementsInRect:targetRect];
    
    for (UICollectionViewLayoutAttributes *layoutAttr in array) {
        CGFloat itemCenterX = layoutAttr.center.x;
        
        if (ABS(itemCenterX - centerX) < ABS(offsetAdjustment)) {
            
            offsetAdjustment = itemCenterX - centerX;
        }
    }
    
    return CGPointMake(proposedContentOffset.x + offsetAdjustment, proposedContentOffset.y);
}
#pragma clang diagnostic pop

@end
