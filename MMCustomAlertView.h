//
//  MMCustomAlertView.h
//
//
//  Created by Michalis Mavris on 04/10/14.
//  Copyright (c) 2014 miksoft.net. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MMCustomAlertViewDelegate <NSObject>

@optional
/*!
@brief This method is a delegate which is called when the OK button is pressed
*/
-(void)MMCustomAlertViewOKButtonDelegate;

@end


@interface MMCustomAlertView : UIView
/*!
@brief This method presents an <b>Alert View</b> with a message provided by the user
@param del The class to be notified when the user clicked the OK button
@param msg The message which will be showed in the alert
@code
MMCustomAlertView *alert = [[MMCustomAlertView alloc]initWithMessage:@"Hi there" andDelegate:self];
[self.view addSubview:alert];
@endcode
 */
-(id)initWithMessage:(NSString*)msg andDelegate:(id <MMCustomAlertViewDelegate>)del;

/*!
 @brief This method presents an <b>Alert View</b> with a message provided by the user and some customisation as <b>backgroundColor,textColor,viewAlpha and isAnimated</b>.
 @param del The class to be notified when the user clicked the OK button
 @param msg The message which will be showed in the alert
 @param backgroundColor The UIColor for the alert view background
 @param textColor The UIColor for the text of the alert view
 @param alpha The alpha (opacity) of the alert view
 @param isAnimated Animates the alert view on show/hide
 @code
 MMCustomAlertView *alert = [[MMCustomAlertView alloc] initWithMessage:@"Hi there" backgroundColor:[UIColor blackColor] textColor:[UIColor blueColor] viewAlpha:0.8 animated:YES andDelegate:self];
 [self.view addSubview:alert]
 @endcode
 */
-(id)initWithMessage:(NSString*)msg backgroundColor:(UIColor*)backgroundColor textColor:(UIColor*)textColor viewAlpha:(float)alpha animated:(BOOL)isAnimated andDelegate:(id<MMCustomAlertViewDelegate>)del;
@end
