//
//  MMCustomAlertView.m
//
//  Created by Michalis Mavris on 04/10/14.
//  Copyright (c) 2014 miksoft.net. All rights reserved.
//

#import "MMCustomAlertView.h"

@interface MMCustomAlertView()

@property (nonatomic, assign) id <MMCustomAlertViewDelegate> delegate;
@property (nonatomic, strong) UILabel *msgLabel;
@property (nonatomic, strong) UIButton *okButton;
@property (nonatomic, strong) UIImageView *backgroundImageView;

@end


@implementation MMCustomAlertView{
    
    BOOL isAlertAnimated;
}

-(id)initWithMessage:(NSString*)msg andDelegate:(id<MMCustomAlertViewDelegate>)del{
    
    self = [super initWithFrame:[[UIScreen mainScreen] bounds]];
    
    if (self) {
        
        self.delegate=del;
        
        isAlertAnimated=YES;

        [self addSubview:self.msgLabel];
        [self addSubview:self.okButton];
        
        self.alpha=0;
        self.backgroundColor = [UIColor blackColor];
        
        self.msgLabel.text=msg;
        self.msgLabel.textColor=[UIColor whiteColor];
        
        self.okButton.tintColor=[UIColor whiteColor];

        [self setupConstraints];
        
    }
    
    //Animate the alpha of View
    [UIView animateWithDuration:0.3 animations:^{self.alpha=0.9;} completion:^(BOOL finished){}];
    
    return self;
}

-(id)initWithMessage:(NSString*)msg backgroundColor:(UIColor*)backgroundColor textColor:(UIColor*)textColor viewAlpha:(float)alpha animated:(BOOL)isAnimated andDelegate:(id<MMCustomAlertViewDelegate>)del{
    
    self = [super initWithFrame:[[UIScreen mainScreen] bounds]];
    
    if (self) {
        
        self.delegate=del;
        
        isAlertAnimated=isAnimated;
       
        [self addSubview:self.msgLabel];
        [self addSubview:self.okButton];
        
        self.alpha=0;
        self.backgroundColor = backgroundColor;
        
        self.msgLabel.textColor=textColor;
        self.msgLabel.text=msg;
        
        self.okButton.tintColor =textColor;
        
        [self setupConstraints];
        
    }
    
    //Check if the user want to animate the Alert View
    if (isAlertAnimated) {
        //Animate the alpha of View
        [UIView animateWithDuration:0.3 animations:^{self.alpha=alpha;} completion:^(BOOL finished){}];
    }
    else{
    
        self.alpha=alpha;
    }
    
    
    return self;
}

- (UILabel *)msgLabel {
    
    if (_msgLabel == nil) {
        
        _msgLabel = [[UILabel alloc] init];
        [_msgLabel setNumberOfLines:0];
        [_msgLabel sizeToFit];
        [_msgLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
        [_msgLabel setBackgroundColor:[UIColor clearColor]];
        [_msgLabel setTextAlignment:NSTextAlignmentCenter];
    }
    
  return _msgLabel;
}
- (UIButton *)okButton {
    
    if (_okButton == nil) {
        
         _okButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_okButton setTranslatesAutoresizingMaskIntoConstraints:NO];
        [_okButton setBackgroundColor:[UIColor clearColor]];
        [_okButton setTitle:@"OK" forState:UIControlStateNormal];
        [_okButton addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    return _okButton;
}

-(void)buttonClicked{

   
    
    if (isAlertAnimated) {
        //Animate, removing the alpha of View and call delegate
        [UIView animateWithDuration:0.3
                         animations:^{
                             self.alpha=0;
                         }
                         completion:^(BOOL finished){
                             [self removeFromSuperview];
                             [self.delegate MMCustomAlertViewOKButtonDelegate];
                         }];

        
    }
    else{
        //Removing the alpha of View and call delegate
        [self removeFromSuperview];
        [self.delegate MMCustomAlertViewOKButtonDelegate];
    
    }
    
    
}

- (void)setupConstraints{
    
    
    
    //msgLabel constraints
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
    
    
    
    
    //okButton constraints
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
