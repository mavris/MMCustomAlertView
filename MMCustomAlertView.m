//
//  UICustomAlertView.m
//  MovieOracle
//
//  Created by Michalis Mavris on 04/10/14.
//  Copyright (c) 2014 miksoft.net. All rights reserved.
//

#import "MMCustomAlertView.h"

@implementation MMCustomAlertView
@synthesize msgLabel,okButton,delegate;

-(id)initWithMessage:(NSString*)msg andDelegate:(id<MMCustomAlertViewDelegate>)del{
    
    self = [super initWithFrame:[[UIScreen mainScreen] bounds]];
    
    if (self) {
        
        self.delegate=del;
        
        self.backgroundColor = [UIColor blackColor];
        self.alpha=0;
       
        [self addSubview:self.msgLabel];
        [self addSubview:self.okButton];
        
        msgLabel.text=msg;
        
        [self setupConstraints];
        
    }
    
    //animate the alpha of View
    [UIView animateWithDuration:0.3 animations:^{
        
        self.alpha=0.9;
    }
                     completion:^(BOOL finished){}];
    

    
    return self;
}

-(id)initWithMessage:(NSString*)msg backgroundColor:(UIColor*)backgroundColor textColor:(UIColor*)textColor viewAlpha:(float)alpha animated:(BOOL)isAnimated andDelegate:(id<MMCustomAlertViewDelegate>)del{
    
    self = [super initWithFrame:[[UIScreen mainScreen] bounds]];
    
    if (self) {
        
        self.delegate=del;
        
        self.backgroundColor = backgroundColor;
        self.alpha=0;
        
        [self addSubview:self.msgLabel];
        [self addSubview:self.okButton];
        
        msgLabel.textColor=textColor;
        msgLabel.text=msg;
        
        okButton.tintColor =textColor;
        
        [self setupConstraints];
        
    }
    
    if (isAnimated) {
        
        //animate the alpha of View
        [UIView animateWithDuration:0.3 animations:^{
                                                     self.alpha=alpha;
                                                    }
                                                    completion:^(BOOL finished){}];
    }
    else{
    
        self.alpha=alpha;
    }
    
    
    return self;
}


- (UILabel *)msgLabel {
    
    if (msgLabel == nil) {
        
        msgLabel = [[UILabel alloc] init];
        msgLabel.numberOfLines=0;
        [msgLabel sizeToFit];
        [msgLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
        msgLabel.backgroundColor = [UIColor clearColor];
        msgLabel.textAlignment=NSTextAlignmentCenter;

    }
    return msgLabel;
    
}
- (UIButton *)okButton {
    
    if (okButton == nil) {
        
        okButton = [UIButton buttonWithType:UIButtonTypeSystem];
 
        [okButton setTranslatesAutoresizingMaskIntoConstraints:NO];
        
        okButton.backgroundColor = [UIColor clearColor];
        
        [okButton setTitle:@"OK" forState:UIControlStateNormal];
        
        [okButton addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return okButton;
    
}

-(void)buttonClicked{

    //animate the alpha of View
    [UIView animateWithDuration:0.3 animations:^{
        
        self.alpha=0;
    }
                     completion:^(BOOL finished){
                     
                         [self removeFromSuperview];
                         [delegate MMCustomAlertViewOKButtonDelegate];
                     
                     }];
    
    
}

- (void)setupConstraints{
    
    // Width constraint
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.msgLabel
                                                     attribute:NSLayoutAttributeWidth
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeWidth
                                                    multiplier:0.8
                                                      constant:0]];
    
    // Height constraint
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.msgLabel
                                                     attribute:NSLayoutAttributeHeight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeHeight
                                                    multiplier:0.2
                                                      constant:0]];
    
    // Center horizontally
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.msgLabel
                                                     attribute:NSLayoutAttributeCenterX
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeCenterX
                                                    multiplier:1.0
                                                      constant:0.0]];
    
    // Center vertically
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.msgLabel
                                                     attribute:NSLayoutAttributeCenterY
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeCenterY
                                                    multiplier:0.6
                                                      constant:0.0]];
    
    
    
    
    
    
    // Width constraint
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.okButton
                                                     attribute:NSLayoutAttributeWidth
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeWidth
                                                    multiplier:0.8
                                                      constant:0]];
    
    // Height constraint
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.okButton
                                                     attribute:NSLayoutAttributeHeight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeHeight
                                                    multiplier:0.08
                                                      constant:0]];
    // Center horizontally
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.okButton
                                                     attribute:NSLayoutAttributeCenterX
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeCenterX
                                                    multiplier:1.0
                                                      constant:0.0]];
    
    // Center vertically
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.okButton
                                                     attribute:NSLayoutAttributeCenterY
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeCenterY
                                                    multiplier:1.0
                                                      constant:0.0]];
    
    
}

@end
