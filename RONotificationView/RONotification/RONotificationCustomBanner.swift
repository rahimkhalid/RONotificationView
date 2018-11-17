//
//  RONotificationCustomBanner.swift
//  RONotificationView
//
//  Created by rahim on 11/13/18.
//  Copyright © 2018 RO. All rights reserved.
//

import Foundation
import UIKit

public class RONotificationCustomBanner: RONotificationView{
    
    public init(configuration: RONotificationCustomViewConfiguration, customView: UIView) {
        
        super.init(config: configuration)
        self.bannerView = customView
        self.type = .Custom
        if let banner = bannerView as? RONotificationCustomBannerView{
            banner.height = customView.frame.height
        }
    }
    
    public init(presentOn view: UIView, config: RONotificationCustomViewConfiguration, customView: UIView) {
        
        super.init(presentOn: view, config: config)
        self.bannerView = customView
        self.type = .Custom
        self.presenterType = .View
        
        if let banner = bannerView as? RONotificationCustomBannerView{
            banner.height = customView.frame.height
        }
    }
    
    public init(presentOn controller: UIViewController, config: RONotificationCustomViewConfiguration, customView: UIView) {
        
        super.init(presentOn: controller.view, config: config)
        self.bannerView = customView
        self.type = .Custom
        self.presenterType = .Controller
        
        if let banner = bannerView as? RONotificationCustomBannerView{
            banner.height = customView.frame.height
        }
    }
}
