//
//  RONotificationCustomBanner.swift
//  RONotificationView
//
//  Created by rahim on 11/13/18.
//  Copyright © 2018 RO. All rights reserved.
//

import Foundation
import UIKit

class RONotificationCustomBanner: RONotificationView{
    
    init(customView: UIView) {
        super.init(config: RONotificationCustomViewConfiguration())
        self.bannerView = customView
        (bannerView as! RONotificationCustomBannerView).height = customView.frame.height
    }
}
