

# RONotificationView
[![CocoaPods](https://img.shields.io/cocoapods/p/RONotificationView.svg)](https://cocoapods.org/pods/RONotificationView)
[![CocoaPods](https://img.shields.io/cocoapods/v/RONotificationView.svg)](https://cocoapods.org/pods/RONotificationView)
## Requirements

- iOS 11.0+
- Xcode 9.0

## Installation

Just add the RONotificationView folder to your project.

or use [CocoaPods](https://cocoapods.org) with Podfile:
```
pod 'RONotificationView'
```

## Usage

1. To use RONotification Banner, you would be needing to create RONotificationConfiguration object. This configuration object is used to customize you banner.

### Customizations allowed:
**For StatusBar Banner**
```
isToAnimateView -- For enable/disable hide, show animations.
duration -- If need to hide view after some time. [Set 0 if want to hide manually.].
messageTextColor -- To set message text color.
backgroundColor -- To set banner background color.  
message -- To set message.
messageFont -- To set message Font.
```
**For Message Banner**
```
isToAnimateView -- For enable/disable hide, show animations.
messageFont -- To set message Font.
titleFont -- To set title Font.
duration -- If need to hide view after some time. [Set 0 if want to hide manually.].
titleTextColor -- To set title text color.
messageTextColor -- To set message text color.
backgroundColor -- To set banner background color.  
image -- To show image on left side of banner.
title -- To set title.
message -- To set message.
isToShowLoader -- To show loader on right side of banner
```
**For ProgressBar Banner**
```
isToAnimateView -- For enable/disable hide, show animations.
backgroundColor -- To set banner background color.  
isToShowProgressCount -- To show ProgressCount in centre of progressBar
progressBarColor -- To set progressbar color
progressCountFont -- To set count font.
progressCountColor  -- To set count text color.
progressBarStartPosition -- To set start value for progressBar (default = 0)
progressBarCurrentPosition -- To set current value for progressBar (incase to start from different value other than start position)
progressBarEndPosition -- To set end value for progressBar
isToAnimateProgressBarGradient -- Used to animate progressbar
```
**For Custom Banner**
```
isToAnimateView -- For enable/disable hide, show animations.
duration -- If need to hide view after some time. [Set 0 if want to hide manually.].
```

## Creating Configuration Object
**For StatusBar Banner**
```
let configuration = RONotificationStatusBarBannerConfiguration(message: MESSAGE, isToAnimateView: True)
```
**For Message Banner**
```
let configuration = RONotificationMessageConfiguration(title: TITLE, message: MESSAGE, isToAnimateView: true)
```
**For ProgressBar Banner**
```
let configuration = RONotificationProgressBarBannerConfiguration(progressBarColor: BAR_COLOR, progressBarStartPosition: 0, progressBarEndPosition: 100, isToAnimateView: true)
```
**For Custom Banner**
```
let configuration = RONotificationCustomViewConfiguration(duration: DURATION, isToAnimateView: true)
```

## To change value after creating Configuration:
```
configuration.isToAnimateView = True
...
```
2. After creating configuration for StatusBar Banner, You need to create StatusBar Banner Object.

##Creating RONotificationView object:
**For StatusBar Banner**
```
banner = RONotificationStatusBarBanner(presentOn: configurationView, config: configuration)
```
**For Message Banner**
```
banner = RONotificationMessageBanner(presentOn: configurationView, config: configuration)
```
**For ProgressBar Banner**
```
banner = RONotificationProgressBarBanner(presentOn: configurationView, config: configuration)
```
**For Custom Banner**
```
banner = RONotificationCustomBanner(presentOn: configurationView, config: configuration, customView:customView)
```
**For Banner on Window**
```
banner = Notification_View_Type(config: configuration)
```
3. Show your banner
```
banner.showBanner(onDismiss: Closure_For_On_Dismiss, onTap: Closure_For_On_Tap, onProgressCompleted: Closure_For_On_Progress_Completed)
```
Closure are optional.

4. Hide your banner.
```
banner.hideBanner()
```
**For Auto-Hide Banner**
```
banner.showBanner(onDismiss: nil, onTap: nil)
```
OnDismiss closure will be called.

## Licence

Folding cell is released under the MIT license.
See [LICENSE](./LICENSE) for details.
