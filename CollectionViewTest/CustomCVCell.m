//
//  CustomCVCell.m
//  CollectionViewTest
//
//  Created by colorful-ios on 16/6/1.
//  Copyright © 2016年 7Color. All rights reserved.
//

#import "CustomCVCell.h"

@implementation CustomCVCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        CGSize cellSize = frame.size;
        
        self.layer.doubleSided = NO;
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5,cellSize.width - 10, cellSize.height*(1-0.3))];
        imageView.center = self.contentView.center;
        imageView.image = [UIImage imageNamed:@"image.jpg"];
        [self.contentView addSubview:imageView];
        
    }
    return self;
}

- (void)configViewTitle:(NSString *)title{
 
//    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, CELLWIDTH, CELLWIDTH)];
//    imageView.image = [UIImage imageNamed:@"image.jpg"];
//    imageView.contentMode = UIViewContentModeScaleAspectFill;
//    [self.contentView addSubview:imageView];
}
@end
