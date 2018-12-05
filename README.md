
# RONotificationView
[![CocoaPods](https://img.shields.io/cocoapods/p/RONotificationView.svg)](https://cocoapods.org/pods/RONotificationView)
[![CocoaPods](https://img.shields.io/cocoapods/v/RONotificationView.svg)](https://cocoapods.org/pods/RONotificationView)
## Requirements

- iOS 11.0+
- Xcode 9.0

## Screenshots

| Message Banner        | StatusBar Banner           |
| ------------- |:------------- |
| ![](https://github.com/rahimkhalid/RONotificationView/blob/master/MessageBanner.gif)      | ![](https://github.com/rahimkhalid/RONotificationView/blob/master/statusBar.gif) |

| Progress Bar Banner        | Custom Banner           |
| ------------- |:------------- |
| ![](https://github.com/rahimkhalid/RONotificationView/blob/master/progressbar.gif)      | ![](https://github.com/rahimkhalid/RONotificationView/blob/master/CustomBanner.gif) |



## Installation

Just add the RONotificationView folder to your project.

or use [CocoaPods](https://cocoapods.org) with Podfile:
```
pod 'RONotificationView'
```

## Usage

1. To use RONotificationView, you would be needing to create RONotificationConfiguration object. This configuration object is used to customize you banner.

* ### Customizations allowed:
  + **For StatusBar Banner**

    `isToAnimateView (Bool)` -- For enable/disable hide, show animations<br />
    `duration (TimeInterval)` -- If need to hide view after some time. [Set 0 if want to hide manually]<br />
    `messageTextColor (UIColor)` -- To set message text color<br />
    `backgroundColor (UIColor)` -- To set banner background color<br /> 
    `message (String)` -- To set message<br />
    `messageFont (UIFont)` -- To set message Font<br />

  + **For Message Banner**

    `isToAnimateView (Bool)` -- For enable/disable hide, show animations<br />
    `messageFont (UIFont)` -- To set message Font<br />
    `titleFont (UIFont)` -- To set title Font<br />
    `duration (TimeInterval)` -- If need to hide view after some time. [Set 0 if want to hide manually]<br />
    `titleTextColor (UIColor)` -- To set title text color<br />
    `messageTextColor (UIColor)` -- To set message text color<br />
    `backgroundColor (UIColor)` -- To set banner background color<br /> 
    `image (UIImage)` -- To show image on left side of banner<br />
    `title (String)` -- To set title<br />
    `message (String)` -- To set message<br />
    `isToShowLoader (Bool)` -- To show loader on right side of banner<br />

  + **For ProgressBar Banner**

    `isToAnimateView (Bool)` -- For enable/disable hide, show animations<br />
    `backgroundColor (UIColor)` -- To set banner background color<br />
    `isToShowProgressCount (Bool)` -- To show ProgressCount in centre of progressBar<br />
    `progressBarColor (UIColor)` -- To set progressbar color<br />
    `progressCountFont (UIFont)` -- To set count font<br />
    `progressCountColor (UIColor)`  -- To set count text color<br />
    `progressBarStartPosition (Float)` -- To set start value for progressBar (default = 0)<br />
    `progressBarCurrentPosition (Float)` -- To set current value for progressBar (incase to start from different value other than start position)<br />
    `progressBarEndPosition (Float)` -- To set end value for progressBar<br />
    `isToAnimateProgressBarGradient (Bool)` -- Used to animate progressbar<br />

  + **For Custom Banner**

    `isToAnimateView (Bool)` -- For enable/disable hide, show animations<br />
    `duration (TimeInterval)` -- If need to hide view after some time. [Set 0 if want to hide manually]<br />


* ### Creating Configuration Object
  + **For StatusBar Banner**
    ```
    let configuration = RONotificationStatusBarBannerConfiguration(message: MESSAGE, isToAnimateView: True)
    ```
  + **For Message Banner**
    ```
    let configuration = RONotificationMessageConfiguration(title: TITLE, message: MESSAGE, isToAnimateView: true)
    ```
  + **For ProgressBar Banner**
    ```
    let configuration = RONotificationProgressBarBannerConfiguration(progressBarColor: BAR_COLOR, progressBarStartPosition: 0, progressBarEndPosition: 100, isToAnimateView: true)
    ```
  + **For Custom Banner**
    ```
    let configuration = RONotificationCustomViewConfiguration(duration: DURATION, isToAnimateView: true)
    ```

* ### To change value after creating Configuration:
    ```
    configuration.isToAnimateView = True
    ...
    ```
2. After creating configuration for StatusBar Banner, You need to create StatusBar Banner Object.

* ### Creating RONotificationView object:
  + **For StatusBar Banner**
    ```
    banner = RONotificationStatusBarBanner(presentOn: configurationView, config: configuration)
    ```
  + **For Message Banner**
    ```
    banner = RONotificationMessageBanner(presentOn: configurationView, config: configuration)
    ```
  + **For ProgressBar Banner**
    ```
    banner = RONotificationProgressBarBanner(presentOn: configurationView, config: configuration)
    ```
  + **For Custom Banner**
    ```
    banner = RONotificationCustomBanner(presentOn: configurationView, config: configuration, customView:customView)
    ```
  + **For Banner on Window**
    ```
    banner = Notification_View_Type(config: configuration)
    ```
* ### Update Banner Configurations:
    Want to change configuration for same banner ? 🤔
    ```
    banner.updateConfiguration(config: configuration)
    ```
3. Show your banner
* ### Show Banner:
    ```
    banner.showBanner(onDismiss: Closure_For_On_Dismiss, onTap: Closure_For_On_Tap, onProgressCompleted: Closure_For_On_Progress_Completed)
    ```
    Closure are optional.

4. Hide your banner.
* ### Hide Banner:
    ```
    banner.hideBanner()
    ```
  + **For Auto-Hide Banner**
    ```
    banner.showBanner(onDismiss: nil, onTap: nil)
    ```
    OnDismiss closure will be called.

## Licence

RONotificationView is released under the MIT license.
See [LICENSE](./LICENSE) for details.
