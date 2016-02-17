//
//  Person.h
//  BMI
//
//  Created by Sumit Jangid on 9/24/15.
//  Copyright (c) 2015 Sumit Jangid. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (strong, nonatomic) NSNumber *height;

@property (strong, nonatomic) NSNumber *weight;

@property (assign, nonatomic) bool sex;

@property (strong, nonatomic) NSNumber *age;

@property (strong, nonatomic) NSNumber *bmi;

@property (strong, nonatomic) NSNumber *bmr;

@property (assign, nonatomic) bool isEnglish;

@property (assign, nonatomic) NSString *BMIdescription;

@property (assign, nonatomic) NSString *imagePath;


+(id)initWithHeight:(NSNumber*)height withWeight:(NSNumber*)weight withSex:(bool)sex withAge:(NSNumber*)age withSystem:(bool)isEnglish;

-(void)calculateBMI;

-(void)calculateBMR;

@end
