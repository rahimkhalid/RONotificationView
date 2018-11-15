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
    
    init(configuration: RONotificationCustomViewConfiguration, customView: UIView) {
        super.init(config: configuration)
        self.bannerView = customView
        
        if let banner = bannerView as? RONotificationCustomBannerView{
            banner.height = customView.frame.height
        }
    }
}
