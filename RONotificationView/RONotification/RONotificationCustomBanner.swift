//
//  RONotificationCustomBanner.swift
//  RONotificationView
//
//  Created by rahim on 11/13/18.
//  Copyright © 2018 RO. All rights reserved.
//

import Foundation
import UIKit

/// RONV: 'RONotificationCustomBanner' This is a child class for 'RONotificationView' basically used for setting up Custom banner.
public class RONotificationCustomBanner: RONotificationView{
    
    /// RONV: This init is called when presenter is used to be set as window. and getting the customView
    /// RONV: It sets type on parent class as custom and
    /// RONV: No need to set PresenterType as default is window.
    public init(configuration: RONotificationCustomViewConfiguration, customView: UIView) {
        
        super.init(config: configuration)
        self.bannerView = customView
        self.type = .custom
        if let banner = bannerView as? RONotificationCustomBannerView{
            banner.height = customView.frame.height
        }
    }
    
    /// RONV: This init is called when presenter is used to be set as UIView. and getting the customView
    /// RONV: It sets type on parent class as custom and
    /// RONV: need to set PresenterType as view.
    public init(presentOn view: UIView, config: RONotificationCustomViewConfiguration, customView: UIView) {
        
        super.init(presentOn: view, config: config)
        self.bannerView = customView
        self.type = .custom
        self.presenterType = .view
        
        if let banner = bannerView as? RONotificationCustomBannerView{
            banner.height = customView.frame.height
        }
    }
    
    /// RONV: This init is called when presenter is used to be set as Controller. and getting the customView
    /// RONV: It sets type on parent class as custom and
    /// RONV: need to set PresenterType as Controller.
    public init(presentOn controller: UIViewController, config: RONotificationCustomViewConfiguration, customView: UIView) {
        
        super.init(presentOn: controller.view, config: config)
        self.bannerView = customView
        self.type = .custom
        self.presenterType = .controller
        
        if let banner = bannerView as? RONotificationCustomBannerView{
            banner.height = customView.frame.height
        }
    }
}
