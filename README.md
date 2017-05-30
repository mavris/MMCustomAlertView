
MMCustomAlertView
======

MMCuctomAlertView is customized full screen AlertView with flat design!

### Features

+ Flat design
+ Customizable
+ Compatbile with all iOS Devices
+ Easy to use

### Configuration

+ Add files in your Xcode project from: File-Add Files to YourProjectName-> Select MMCustomAlertView.m and MMCustomAlertView.h -> Click on "copy items if needed" -> OK

### How to use it

Import the class in your class:

```
#import "MMCustomAlertView.h"
```

Set your class as delegate of MMCustomAlertView

```
@interface ViewController : UIViewController<MMCustomAlertViewDelegate>
```

Init and show the alert:

```
- (IBAction)showDefaultAlert:(id)sender {
     MMCustomAlertView *alert = [[MMCustomAlertView alloc]initWithMessage:@"Hi there" andDelegate:self];
    [self.view addSubview:alert];
}
```

Implementing the MMCustomAlertViewOKButtonDelegate in your class in order to perform an action when the "OK" button clicked.

```
-(void)MMCustomAlertViewOKButtonDelegate{
    //Do something after OK button pressed
    NSLog(@"OK button pressed");
}
```

# ![Screenshot](https://raw.github.com/mavris/MMCustomAlertView/master/screenshot1.png)

That's it!

If you don't need to perform an action when "OK" button is clicked just enter "nil" as delegate paramater.

You can also customize the background color, the text color, the alpha of the view and the animation:

```
- (IBAction)showCustomAlert:(id)sender {
    MMCustomAlertView *alert = [[MMCustomAlertView alloc] initWithMessage:@"Hi there" backgroundColor:[UIColor blackColor] textColor:[UIColor blueColor] viewAlpha:0.8 animated:YES andDelegate:nil];
    [self.view addSubview:alert];
}
```

### Authors

* Michael Mavris

### License

Copyright Miksoft 2016

Licensed under the MIT License
