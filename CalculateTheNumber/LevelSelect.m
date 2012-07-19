//
//  LevelSelect.m
//  CalculateTheNumber
//
//  Created by iD Student on 7/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LevelSelect.h"
#import "EasyLevelsViewController.h"

@interface LevelSelect ()

@end

@implementation LevelSelect

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)easyLevelSelect:(id)sender {
    levelID = [sender tag];
}
@end
