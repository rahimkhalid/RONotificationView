//
//  RONotificationStatusBarBanner.swift
//  RONotificationView
//
//  Created by rahim on 11/12/18.
//  Copyright © 2018 RO. All rights reserved.
//

import Foundation
import UIKit

/// RONV: 'RONotificationStatusBarBanner' This is a child class for 'RONotificationView' basically used for setting up status bar banner.
public class RONotificationStatusBarBanner: RONotificationView{

    /// RONV: This init is called when presenter is used to be set as window.
    /// RONV: It sets type on parent class as onStatusBar and
    /// RONV: No need to set PresenterType as default is window.
    public init(_ config: RONotificationStatusBarBannerConfiguration) {
        super.init(config: config)
        self.type = .onStatusBar
    }
    
    /// RONV: This init is called when presenter is used to be set as UIView.
    /// RONV: It sets type on parent class as onStatusBar and
    /// RONV: need to set PresenterType as view.
    public init(presentOn view: UIView, config: RONotificationStatusBarBannerConfiguration) {
        super.init(presentOn: view, config: config)
        self.type = .onStatusBar
        self.presenterType = .view
    }
    
    /// RONV: This init is called when presenter is used to be set as Controller.
    /// RONV: It sets type on parent class as onStatusBar and
    /// RONV: need to set PresenterType as Controller.
    public init(presentOn controller: UIViewController, config: RONotificationStatusBarBannerConfiguration) {
        super.init(presentOn: controller.view, config: config)
        self.type = .onStatusBar
        self.presenterType = .controller
    }
}
