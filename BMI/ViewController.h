//
//  ViewController.h
//  BMI
//
//  Created by Sumit Jangid on 9/18/15.
//  Copyright (c) 2015 Sumit Jangid. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UISwitch *UnitsSwitch;

@property (weak, nonatomic) IBOutlet UITextField *height;

@property (weak, nonatomic) IBOutlet UILabel *heightUnits;

@property (weak, nonatomic) IBOutlet UITextField *weight;

@property (weak, nonatomic) IBOutlet UILabel *weightUnits;

@property (weak, nonatomic) IBOutlet UITextField *age;

@property (weak, nonatomic) IBOutlet UILabel *BMI;

@property (weak, nonatomic) IBOutlet UILabel *BMR;

- (IBAction)calculateResult:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *BMIRange;

@property (weak, nonatomic) IBOutlet UISwitch *gender;

@property (weak, nonatomic) IBOutlet UILabel *genderMale;

@property (weak, nonatomic) IBOutlet UILabel *genderFemale;

@property (weak, nonatomic) IBOutlet UIImageView *image;

@end
