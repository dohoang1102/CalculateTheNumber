//
//  FirstViewController.m
//  CalculateTheNumber
//
//  Created by iD Student on 7/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController
@synthesize bigView;
@synthesize Answer;
@synthesize hideDecimal;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    hideDecimal.hidden = true;
    
}

- (void)viewDidUnload
{
    [self setAnswer:nil];
    [self setHideDecimal:nil];
    [self setBigView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)getNumber:(id)sender {
    if (enterPressed) {
        firstNumber = 0;
        secondNumber = 0;
        didPressOperator = false;
        enterPressed = false;
        signChanged = false;
        didAddDecimal = false;
    }
    //Not working decimals, need work
    if (didAddDecimal) {
        decimalNumbers = 0;
        decimalNumbers++;
        if (didPressOperator) {
            secondNumber = secondNumber * 10 + (float) [sender tag];
            for (int i = 0; i < decimalNumbers; i++) {
                secondNumber /= 10;
            }
            Answer.text = [NSString stringWithFormat:@"%f", secondNumber];
            switch (operation) {
                case 12:
                    firstNumber += secondNumber;
                    break;
                    
                case 13:
                    firstNumber -= secondNumber;
                    break;
                    
                case 14:
                    firstNumber *= secondNumber;
                    break;
                    
                case 15:
                    firstNumber /= secondNumber;
                    break;
                    
                default:
                    break;
            }
            secondNumber = 0;
        }
        else {
            firstNumber = firstNumber * 10 + (float) [sender tag];
            Answer.text = [NSString stringWithFormat:@"%f", firstNumber];
        }
        
    }
    else if (didPressOperator) {
        if (signChanged) {
            secondNumber = secondNumber * 10 - (float) [sender tag];
        }
        else {
            secondNumber = secondNumber * 10 + (float) [sender tag];
        }
        Answer.text = [NSString stringWithFormat:@"%f", secondNumber];
        switch (operation) {
            case 12:
                firstNumber += secondNumber;
                break;
                
            case 13:
                firstNumber -= secondNumber;
                break;
                
            case 14:
                firstNumber *= secondNumber;
                break;
                
            case 15:
                firstNumber /= secondNumber;
                break;
                
            default:
                break;
        }
        secondNumber = 0;
        signChanged = false;
    }
    else if (signChanged) {
        firstNumber = firstNumber * 10 - (float) [sender tag];
    }
    else {
        firstNumber = firstNumber * 10 + (float) [sender tag];
    }
    Answer.text = [NSString stringWithFormat:@"%f", firstNumber];
    signChanged = false;
}

- (IBAction)getOperator:(id)sender {
    enterPressed = false;
    operation = [sender tag];
    switch (operation) {
        case 12:
            operationLiteral = @"+";
            break;
            
        case 13:
            operationLiteral = @"–";
            break;
            
        case 14:
            operationLiteral = @"×";
            break;
            
        case 15:
            operationLiteral = @"÷";
            break;
            
        default:
            break;
    }
    signChanged = false;
    Answer.text = [NSString stringWithFormat:@"%f %@", firstNumber, operationLiteral];
    didPressOperator = true;
    didAddDecimal = false;
}

- (IBAction)changeSign:(id)sender {
    if (secondNumber == 0 || firstNumber == 0) {
        signChanged = true;
    }
    firstNumber -= firstNumber * 2;
    Answer.text = [NSString stringWithFormat:@"%f", firstNumber];
    enterPressed = false;
}

- (IBAction)Clear:(id)sender {
    Answer.text = [NSString stringWithFormat:@""];
    firstNumber = 0;
    secondNumber = 0;
    didPressOperator = false;
    Answer.text = [NSString stringWithFormat:@"%f", firstNumber];
    signChanged = false;
}

- (IBAction)Evaluate:(id)sender {
    Answer.text = [NSString stringWithFormat:@"%f", firstNumber];
    enterPressed = true;
    didAddDecimal = false;
    signChanged = false;
}

- (IBAction)addDecimal:(id)sender {
    didAddDecimal = true;
    Answer.text = [NSString stringWithFormat:@"%f", secondNumber];
}

- (IBAction)switchToHiddenUI:(id)sender {
    [self performSegueWithIdentifier: @"Segue3" sender: self];
}

- (IBAction)getMemoryOperator:(id)sender {
    if (didPressOperator) {
        switch ([sender tag]) {
            case 14:
                memory = 0;
                break;
                
            case 15:
                memory += secondNumber;
                break;
                
            case 16:
                memory -= secondNumber;
                break;
                    
            case 17:
                secondNumber = memory;
                Answer.text = [NSString stringWithFormat:@"%f", secondNumber];
                switch (operation) {
                    case 12:
                        firstNumber += secondNumber;
                        break;
                        
                    case 13:
                        firstNumber -= secondNumber;
                        break;
                        
                    case 14:
                        firstNumber *= secondNumber;
                        break;
                        
                    case 15:
                        firstNumber /= secondNumber;
                        break;
                        
                    default:
                        break;
                }
                break;
                    
                default:
                    break;
        }
    }
    else {
        switch ([sender tag]) {
            case 14:
                memory = 0;
                break;
                
            case 15:
                memory += firstNumber;
                break;
                
            case 16:
                memory -= firstNumber;
                break;
                
            case 17:
                firstNumber = memory;
                didPressOperator = false;
                Answer.text = [NSString stringWithFormat:@"%f", firstNumber];
                break;
                
            default:
                break;
        }
    }
}

@end
