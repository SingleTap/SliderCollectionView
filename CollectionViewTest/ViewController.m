//
//  ViewController.m
//  CollectionViewTest
//
//  Created by colorful-ios on 16/6/1.
//  Copyright © 2016年 7Color. All rights reserved.
//

#import "ViewController.h"
#import "SliderCollectionView.h"


#define HEIGHT      [UIScreen mainScreen].bounds.size.height
#define WIDTH       [UIScreen mainScreen].bounds.size.width


@interface ViewController ()

@property (nonatomic,strong)SliderCollectionView    *sliderCollectionView;


@end


@implementation ViewController

//@synthesize mainCollectionView = _mainCollectionView;

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    [self configCollectionView];


}

- (void)configCollectionView{
    
    [self.view addSubview:({
        
        CGFloat cellWidth = ([UIScreen mainScreen].bounds.size.width - 20)/2;
        CGFloat transtionScale = 0.3;

        _sliderCollectionView = [[SliderCollectionView alloc]initWithFrame:CGRectMake(0, 100, WIDTH, 300)];
        _sliderCollectionView.cellSize = (CGSize){cellWidth,cellWidth*(1+transtionScale)};
        _sliderCollectionView.transtionScale = transtionScale;
        _sliderCollectionView.dataArray = @[@"image.jpg",@"image.jpg",@"image.jpg",@"image.jpg",@"image.jpg",@"image.jpg",@"image.jpg",@"image.jpg",@"image.jpg",@"image.jpg",@"image.jpg",@"image.jpg",@"image.jpg",@"image.jpg"];
        _sliderCollectionView;
    })];

    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
