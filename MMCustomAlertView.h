//
//  MMCustomAlertView.h
//
//
//  Created by Michalis Mavris on 04/10/14.
//  Copyright (c) 2014 miksoft.net. All rights reserved.
//

#import <UIKit/UIKit.h>
//============
@protocol MMCustomAlertViewDelegate <NSObject>

@optional

-(void)MMCustomAlertViewOKButtonDelegate;

@end

//===========


@interface MMCustomAlertView : UIView

@property (nonatomic, assign) id <MMCustomAlertViewDelegate> delegate;
@property (nonatomic, strong) UILabel *msgLabel;
@property (nonatomic, strong) UIButton *okButton;


-(id)initWithMessage:(NSString*)msg andDelegate:(id <MMCustomAlertViewDelegate>)del;
-(id)initWithMessage:(NSString*)msg backgroundColor:(UIColor*)backgroundColor textColor:(UIColor*)textColor viewAlpha:(float)alpha animated:(BOOL)isAnimated andDelegate:(id<MMCustomAlertViewDelegate>)del;
@end
