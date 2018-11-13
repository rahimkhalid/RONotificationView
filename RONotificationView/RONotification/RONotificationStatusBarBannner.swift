//
//  RONotificationStatusBarBanner.swift
//  RONotificationView
//
//  Created by rahim on 11/12/18.
//  Copyright © 2018 RO. All rights reserved.
//

import Foundation
import UIKit

class RONotificationStatusBarBanner: RONotificationView{
    
    private var statusBarHeight:CGFloat = {
        return UIApplication.shared.statusBarFrame.size.height
    }()

    init(_ config: RONotificationStatusBarBannerConfiguration) {
        super.init(config: config)
        self.type = RONotificationType.onStatusBar
    }
}
