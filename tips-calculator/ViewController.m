//
//  ViewController.m
//  tips-calculator
//
//  Created by Kenny Wong on 12/25/14.
//  Copyright (c) 2014 wasabicone. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

// Properties are how you access the element.
@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

// Event handlers
// The *minus* indicates that this is an instance method instead of a class method.

// Handles tap event on the app
- (IBAction)onTap:(id)sender;
- (void)updateValues;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self) {
        self.title = @"Tip Calculator";
        [self updateValues];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
    [self updateValues];
}

- (void)updateValues {
    // Do math
    float billAmount = [self getBillAmount];
    float tipAmount = billAmount * [self getTipValue];
    float totalAmount = tipAmount + billAmount;
    
    // Update view
    // @NOTE(dashk): %0.2f = Float with 2 decimal places
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f", totalAmount];
}

- (float)getTipValue {
    NSArray *tipValues = @[@(0.1), @(0.15), @(0.2)];
    return [tipValues[self.tipControl.selectedSegmentIndex] floatValue];
}

- (float)getBillAmount {
    // @NOTE(dashk): self.billTextField.text is like self.billTextField.text.floatValue() in Java
    return [self.billTextField.text floatValue];
}

@end
