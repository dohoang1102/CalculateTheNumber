//
//  FirstViewController.h
//  CalculateTheNumber
//
//  Created by iD Student on 7/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController {
    double firstNumber;
    double secondNumber;
    double memory;
    bool didPressOperator;
    bool enterPressed;
    bool didAddDecimal;
    bool signChanged;
    int operation;
    int decimalNumbers;
    NSString *operationLiteral;
}

- (IBAction)getNumber:(id)sender;
- (IBAction)getOperator:(id)sender;
- (IBAction)changeSign:(id)sender;
- (IBAction)Clear:(id)sender;
- (IBAction)Evaluate:(id)sender;
- (IBAction)addDecimal:(id)sender;
- (IBAction)switchToHiddenUI:(id)sender;
- (IBAction)getMemoryOperator:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *bigView;
@property (weak, nonatomic) IBOutlet UILabel *Answer;
@property (weak, nonatomic) IBOutlet UIButton *hideDecimal;

@end
