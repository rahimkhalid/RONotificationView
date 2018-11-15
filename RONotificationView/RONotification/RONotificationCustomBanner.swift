//
//  RONotificationCustomBanner.swift
//  RONotificationView
//
//  Created by rahim on 11/13/18.
//  Copyright © 2018 RO. All rights reserved.
//

import Foundation
import UIKit

open class RONotificationCustomBanner: RONotificationView{
    
    init(configuration: RONotificationCustomViewConfiguration, customView: UIView) {
        super.init(config: configuration)
        self.bannerView = customView
        (bannerView as! RONotificationCustomBannerView).height = customView.frame.height
    }
}
