//
//  RONotificationStatusBarBanner.swift
//  RONotificationView
//
//  Created by rahim on 11/12/18.
//  Copyright © 2018 RO. All rights reserved.
//

import Foundation
import UIKit

public class RONotificationStatusBarBanner: RONotificationView{

    public init(_ config: RONotificationStatusBarBannerConfiguration) {
        super.init(config: config)
        self.type = RONotificationType.onStatusBar
    }
    
    public init(presentOn view: UIView, config: RONotificationStatusBarBannerConfiguration) {
        super.init(presentOn: view, config: config)
        self.type = RONotificationType.onStatusBar
    }
    
    public init(presentOn controller: UIViewController, config: RONotificationStatusBarBannerConfiguration) {
        super.init(presentOn: controller.view, config: config)
        self.type = RONotificationType.onStatusBar
    }
}
