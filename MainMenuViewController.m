//
//  MainMenuViewController.m
//  Alcolator
//
//  Created by Tom Lee on 11/18/14.
//  Copyright (c) 2014 Tom Lee. All rights reserved.
//


#import "MainMenuViewController.h"

@interface MainMenuViewController ()
@property (weak, nonatomic) UIButton *winePressed;
@property (weak, nonatomic) UIButton *whiskeyPressed;

@end


@implementation MainMenuViewController

-(void) loadView {
    
    self.view = [[UIView alloc] init];
    UIButton *button1 = [UIButton buttonWithType: UIButtonTypeSystem];
    UIButton *button2 = [UIButton buttonWithType: UIButtonTypeSystem];
    [self.view addSubview:button1];
    [self.view addSubview:button2];
    self.winePressed = button1;
    self.whiskeyPressed = button2;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self.winePressed addTarget:self action:@selector(winePressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.winePressed setTitle:NSLocalizedString(@"Wine!", @"wine") forState:UIControlStateNormal];
    [self.whiskeyPressed addTarget:self action:@selector(whiskeyPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.whiskeyPressed setTitle:NSLocalizedString(@"Whiskey!", @"whiskey") forState:UIControlStateNormal];

    self.title = NSLocalizedString(@"Select Alcolator", @"select alcolator");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) winePressed:(UIButton *) sender {
    ViewController *wineVC = [[ViewController alloc] init];
    [self.navigationController pushViewController:wineVC animated:YES];
}

- (void) whiskeyPressed:(UIButton *) sender {
    WhiskeyViewController *whiskeyVC = [[WhiskeyViewController alloc] init];
    [self.navigationController pushViewController:whiskeyVC animated:YES];
}

- (void) viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    
    self.winePressed.frame = CGRectMake(50, 64 + 20, 80, 44);
    self.whiskeyPressed.frame = CGRectMake(180, 64 + 20, 80, 44);
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
