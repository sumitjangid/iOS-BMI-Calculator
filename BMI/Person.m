//
//  Person.m
//  BMI
//
//  Created by Sumit Jangid on 9/24/15.
//  Copyright (c) 2015 Sumit Jangid. All rights reserved.
//

#import "Person.h"

static Person * p;

@implementation Person

@synthesize height;
@synthesize weight;
@synthesize sex;
@synthesize age;
@synthesize bmi;
@synthesize bmr;
@synthesize BMIdescription;
@synthesize imagePath;

//Singleton logic
//Constructing Singleton Object
+(Person*)initWithHeight:(NSNumber*)height withWeight:(NSNumber*)weight withSex:(bool)sex withAge:(NSNumber*)age withSystem:(bool)isEnglish {

    if(p != nil) {
        
        p.height = height;
        p.weight = weight;
        p.sex = sex;
        p.age = age;
        p.isEnglish = isEnglish;
        return  p;
        
    } else {
        
        p = [[Person alloc] init];
        p.height = height;
        p.weight = weight;
        p.sex = sex;
        p.age = age;
        p.isEnglish = isEnglish;
        return p;
        
    }
}

//Calculate BMI

-(void)calculateBMI {
    
    if(!self.isEnglish){
        
        //Converting Metric Units into US Units (that is where height is in cms is converted into inches and weight is in kgs is converted into Pounds(lbs))
        
        weight = [NSNumber numberWithFloat:[weight floatValue] * 2.2];
        height = [NSNumber numberWithFloat:[height floatValue] / 2.5];
        
    }
    
    //BMI Formula
    
    self.bmi = [NSNumber numberWithFloat:([self.weight floatValue] / ([self.height floatValue] * [self.height floatValue]))*703];
    
    //BMI Range
    
    if([bmi floatValue] < 16.00) {
        
        self.BMIdescription = @"Severe Thinness";
        self.imagePath = @"SevereThinness.png";
        
    }else if([bmi floatValue] <=16.00 && [bmi floatValue]<16.99) {
        
        self.BMIdescription = @"Moderate Thinness";
        self.imagePath = @"ModerateThinness.png";
    }
    else if([bmi floatValue] >=17.00 && [bmi floatValue]<18.49)
    {
        self.BMIdescription = @"Mild Thinness";
        self.imagePath = @"ModerateThinness.png";
        
    }
    else if([bmi floatValue] >=18.50 && [bmi floatValue]<24.99)
    {
        self.BMIdescription = @"Normal Range";
        self.imagePath = @"NormalRange.png";
        
    }
    
    else if([bmi floatValue] >=25.00 && [bmi floatValue]<29.99)
    {
        self.BMIdescription = @"OverWeight";
        self.imagePath = @"OverWeight.png";
        
    }
    else if([bmi floatValue] >=30.00 && [bmi floatValue]<34.99)
    {
        self.BMIdescription = @"Obese Class I(Moderate)";
        self.imagePath = @"OverWeight.png";
        
    }
    else if([bmi floatValue] >=35.00 && [bmi floatValue]<39.99)
    {
        self.BMIdescription = @"Obese Class II(Severe)";
        self.imagePath = @"OverWeight.png";
        
    }
    else if([bmi floatValue]>=39.99)
    {
        self.BMIdescription = @"Obese Class III(Very Severe)";
        self.imagePath = @"ObeseClass3.png";
    }
}

//Calculate BMR

-(void)calculateBMR {
    
    if(self.sex) {
        
        //Calculating BMR for Female
        
        self.bmr = [NSNumber numberWithFloat: 66 + (13.7 * [self.weight floatValue]) + (5 * [self.height floatValue])- (6.8 * [age intValue])];
        
    }else if(!self.sex) {
        
        //Calculating BMR for Male
        
        self.bmr = [NSNumber numberWithFloat: 655 + (9.6 * [self.weight floatValue]) + (1.8 * [self.height floatValue]) - (4.7 * [age intValue])];
        
    }
}

@end