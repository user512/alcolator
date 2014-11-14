//
//  ViewController.h
//  Alcolator
//
//  Created by Tom Lee on 10/20/14.
//  Copyright (c) 2014 Tom Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) UITextField *beerPercentTextField;
@property (weak, nonatomic) UILabel *resultLabel;
@property (weak, nonatomic) UISlider *beerCountSlider;

- (void)buttonPressed:(UIButton *)sender;
@end
