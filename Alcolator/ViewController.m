//
//  ViewController.m
//  Alcolator
//
//  Created by Tom Lee on 10/20/14.
//  Copyright (c) 2014 Tom Lee. All rights reserved.
//

#import "ViewController.h"

//@interface ViewController ()
@interface ViewController () <UITextFieldDelegate>

//@property (weak, nonatomic) IBOutlet UITextField *beerPercentTextField;
//@property (weak, nonatomic) IBOutlet UISlider *beerCountSlider;
//@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@property (weak, nonatomic) UIButton *calculateButton;
@property (weak, nonatomic) UITapGestureRecognizer *hideKeyboardTapGestureRecognizer;
// Why don't I need this line?
//@property (nonatomic, retain) UIColor *textColor;

//@property (nonatomic) UITextBorderStyle borderStyle;

@end


@implementation ViewController


-(void)loadView {
    // Allocate and initialize the all-encompassing view
    // What does it mean?
    self.view = [[UIView alloc] init];
    
    // Allocate and initialized each of our views and the gesture recognizer
    // Does it mean to declare(initialize) view and gesture recognizer?
    UITextField *textField = [[UITextField alloc] init];
    UISlider *slider = [[UISlider alloc] init];
    UILabel *label = [[UILabel alloc] init];
    UIButton *button = [UIButton buttonWithType: UIButtonTypeSystem];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
    label.font = [UIFont fontWithName:@"American Typewriter" size:20];
    textField.font = [UIFont fontWithName:@"Marker Felt" size:20];
    //button.titleLabel.font = [UIFont fontWithName:@"American Typewriter" size:25];
    //button.tintColor = [UIColor purpleColor];
    
    
    // Add each view and the gesture recognizer as the view's subviews
    // self. ??? from?
    [self.view addSubview:textField];
    [self.view addSubview:slider];
    [self.view addSubview:label];
    [self.view addSubview:button];
    [self.view addGestureRecognizer:tap];
    

    
    // Assign the views and gesture recognizer to our properties
    // Connect the previous part to newly declared method?
    self.beerPercentTextField = textField;
    self.beerCountSlider = slider;
    self.resultLabel = label;
    self.calculateButton = button;
    self.hideKeyboardTapGestureRecognizer = tap;
    
}

- (void)viewDidLoad
{
    
    // Calls the superclass's implementation
    [super viewDidLoad];

    
    //
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    // Tells the text field that 'self', this instance of 'BLCViewController' should be treated as the text field's delegate
    self.beerPercentTextField.delegate = self;
    
    // Set the placeholder text
    self.beerPercentTextField.placeholder = NSLocalizedString(@"% Alcohol Content Per Beer", @"Beer percent placeholder text");
    
    // Tells 'self.beerCountSlider' that when its value changes, it should call '[self -sliderValueDidChange:]'.
    // Connecting the IBAction in previous checkpoint
    [self.beerCountSlider addTarget:self action:@selector(sliderValueDidChange:) forControlEvents:UIControlEventValueChanged];
    
    //Set the min and max for the slider
    self.beerCountSlider.minimumValue = 1;
    self.beerCountSlider.maximumValue = 10;
    
    // Tells 'self.calculateButton' that when a finger is lifted from the button while still inside its bounds
    [self.calculateButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    // Set the tutle of the button
    [self.calculateButton setTitle:NSLocalizedString(@"Calculate!", @"Calculate command") forState:UIControlStateNormal];
    
    // Tells the tapgesture recognizer to call '[self -tapGestureDidFire:]' when it detects a tap.
    [self.hideKeyboardTapGestureRecognizer addTarget:self action:@selector(tapGestureDidFire:)];
    
    // Gets rid of the max number of lines on the label
    self.resultLabel.numberOfLines = 0;
    
    // Change resultLabel font color
    self.resultLabel.textColor = [UIColor blueColor];
    
    // Change text field text color
    self.beerPercentTextField.textColor = [UIColor yellowColor];
    
    // Change textField background color
    self.beerPercentTextField.backgroundColor = [UIColor blackColor];
    
    self.title = NSLocalizedString(@"Wine", @"wine");
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (IBAction)textFieldDidChange:(UITextField *)sender {
- (void)textFieldDidChange: (UITextField *)sender {
    NSString *enteredText = sender.text;
    float enteredNumber = [enteredText floatValue];
    
    if (enteredNumber == 0) {
        sender.text = nil;
    }
    
    
}

//- (IBAction)sliderValueDidChange:(UISlider *)sender {
- (void)sliderValueDidChange: (UISlider *)sender {
    
    [self buttonPressed: nil];
    
}

- (void)buttonPressed:(UIButton *)sender {
    [self.beerPercentTextField resignFirstResponder];
    
    int numberOfBeers = self.beerCountSlider.value;
    int ouncesInOneBeerGlass = 12;
    
    float alcoholPercentageOfBeer = [self.beerPercentTextField.text floatValue] / 100;
    float ouncesOfAlcoholPerBeer = ouncesInOneBeerGlass * alcoholPercentageOfBeer;
    float ouncesOfAlcoholTotal = ouncesOfAlcoholPerBeer * numberOfBeers;
    
    
    float ouncesInOneWineGlass = 5;
    float alcoholPercentageOfWine = 0.13;
    
    float ouncesOfAlcoholPerWineGlass = ouncesInOneWineGlass * alcoholPercentageOfWine;
    float numberOfWineGlassesForEquivalentAlcoholAmount = ouncesOfAlcoholTotal / ouncesOfAlcoholPerWineGlass;
    
    NSString *beerText;
    
    if (numberOfBeers == 1) {
        beerText = NSLocalizedString(@"beer", @"singular beer'");
    } else {
        beerText = NSLocalizedString(@"beers", @"plural of beeer");
    }
    
    NSString *wineText;
    
    if (numberOfWineGlassesForEquivalentAlcoholAmount == 1) {
        wineText = NSLocalizedString(@"glass", @"singular glass");
    } else {
        wineText = NSLocalizedString(@"glasses", @"plural of glass");
    }
    
    NSString *resultText = [NSString stringWithFormat:NSLocalizedString(@"%d %@ contains as much alcohol as %.0f %@ of wine.", nil), numberOfBeers, beerText, numberOfWineGlassesForEquivalentAlcoholAmount, wineText];
    self.resultLabel.text = resultText;
    
}



//- (IBAction)tapGestureDidFire:(UITapGestureRecognizer *)sender {
- (void)tapGestureDidFire: (UITapGestureRecognizer *)sender  {
    [self.beerPercentTextField resignFirstResponder];
}

// To decide where to put sliders textfield...
- (void) viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    CGFloat viewWidth = CGRectGetWidth(self.view.bounds);
    CGFloat padding = 20;
    CGFloat itemWidth = viewWidth - padding - padding;
    CGFloat itemHeight = 44;

    
    self.beerPercentTextField.frame = CGRectMake(padding, padding, itemWidth, itemHeight);
    
    CGFloat bottomOfTextField = CGRectGetMaxY(self.beerPercentTextField.frame);
    self.beerCountSlider.frame = CGRectMake(padding, bottomOfTextField + padding, itemWidth, itemHeight);
    
    CGFloat bottomOfSlider = CGRectGetMaxY(self.beerCountSlider.frame);
    self.resultLabel.frame = CGRectMake(padding, bottomOfSlider + padding, itemWidth, itemHeight + 4);
    
    CGFloat bottomOfLabel = CGRectGetMaxY(self.resultLabel.frame);
    self.calculateButton.frame = CGRectMake(padding, bottomOfLabel + padding, itemWidth, itemHeight);
    
    
}

@end
