//
//  ViewController.m
//  BMI
//
//  Created by Sumit Jangid on 9/18/15.
//  Copyright (c) 2015 Sumit Jangid. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

int switchControl, genderControl=0;

@interface ViewController ()

@end

@implementation ViewController

//If number pad blocks your buttons or some keys..
-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.height resignFirstResponder];
    [self.weight resignFirstResponder];
    [self.age resignFirstResponder];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.UnitsSwitch addTarget:self action:@selector(switchControl) forControlEvents:UIControlEventValueChanged];
    
    [self.gender addTarget:self action:@selector(genderControl) forControlEvents:UIControlEventValueChanged];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Switch control for Units (US Units that is Pounds for Weight and Inches for Height .. Metric Units that is Kgs for Weight and cms for Height)

-(void) switchControl
{

    self.height.text   = @"";
    self.weight.text   = @"";
    self.BMI.text      = @"";
    self.BMIRange.text = @"";
    
    if (switchControl==0) {
        
        //Metric Units
        switchControl = 1;
        self.heightUnits.text =@"cms";
        self.weightUnits.text =@"kgs";
        
    }
    else{
    
        //US Units
        switchControl = 0;
        self.heightUnits.text =@"Inches";
        self.weightUnits.text =@"lbs";
        
    }
}

//Switch control for Gender (Male or Female)

-(void) genderControl
{
    if (genderControl==0) {
        
        genderControl = 1;
        self.genderMale.text =@"Male";
        
    } else {
        
        genderControl = 0;
        self.genderFemale.text =@"Female";
        
    }
}

//Calculate Button

- (IBAction)calculateResult:(id)sender {
    
    float height = [[self.height text] floatValue];
    float weight = [[self.weight text] floatValue];
    
    bool sex = YES;
    
    if(genderControl == 0) {
        
        sex = NO;
        
    } else {
        
        sex = YES;
    }
    
    // isEnglish is US Units
    
    bool isEnglish = YES;
    
    if(switchControl == 0) {
        
        isEnglish = YES;
        
    } else {
        
        isEnglish = NO;
    }
    
    //Age input through Text
    int age = [[self.age text] intValue];
    
    //Creating Singleton object of Person Class
    Person *p = [Person initWithHeight:[NSNumber numberWithFloat:height] withWeight:[NSNumber numberWithFloat:weight] withSex:sex withAge:[NSNumber numberWithInt:age]  withSystem:isEnglish];
    
    // Calculate BMR and BMI
    [p calculateBMI];
    
    [p calculateBMR];
    
    NSLog(@"Your Weight is %@ and Height is %@ . Your Age is %@ . BMI is %@ and You are %@ . Your BMR is %@  %@", p.weight,p.height,p.age,p.bmi,p.BMIdescription,p.bmr,p.imagePath);
    
    //Displaying BMI BMR and BMIDescription using Singleton
    
    UIImage *image = [UIImage imageNamed: p.imagePath];
    
    _image.image = image;
 
    self.BMI.text = [NSString stringWithFormat:@"%@",p.bmi];
    
    self.BMR.text = [NSString stringWithFormat:@"%@",p.bmr];
    
    self.BMIRange.text = p.BMIdescription;

}
@end
