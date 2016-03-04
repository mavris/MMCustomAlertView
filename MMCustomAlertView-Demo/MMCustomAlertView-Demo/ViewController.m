//
//  ViewController.m
//  MMCustomAlertView-Demo
//
//  Created by Michalis Mavris on 27/03/15.
//  Copyright (c) 2015 Miksoft. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)showDefaultAlert:(id)sender {
    
    MMCustomAlertView *alert = [[MMCustomAlertView alloc]initWithMessage:@"Hi there" andDelegate:self];
    [self.view addSubview:alert];
}
- (IBAction)showCustomAlert:(id)sender {
    
    MMCustomAlertView *alert = [[MMCustomAlertView alloc]initWithMessage:@"Hi there" backgroundColor:[UIColor blackColor] textColor:[UIColor blueColor] viewAlpha:0.8 animated:YES andDelegate:self];
    [self.view addSubview:alert];
}

- (IBAction)buttonPressed:(id)sender {
   
}
-(void)MMCustomAlertViewOKButtonDelegate{
    
    //Do something after OK button pressed
    NSLog(@"OK button pressed");
}


@end
