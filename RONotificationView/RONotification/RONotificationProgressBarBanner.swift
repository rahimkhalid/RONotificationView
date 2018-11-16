//
//  RONotificationProgressBarBanner.swift
//  RONotificationView
//
//  Created by rahim on 11/14/18.
//  Copyright © 2018 RO. All rights reserved.
//

import Foundation
import UIKit

public class RONotificationProgressBarBanner: RONotificationView{
    
    init(_ config: RONotificationProgressBarBannerConfiguration) {
        super.init(config: config)
        self.type = RONotificationType.progress
    }
    
    public func updateProgressBarTo(position: Float){
        if let config = configuration as? RONotificationProgressBarBannerConfiguration,
            let banner = bannerView as? RONotificationProgressBarBannerView {
                
            config.setCurrentProgress(progress: position)
            let current = position > 100 ? 100 : position
            
            banner.animateProgressBarTo(position: current, final: config.progressBarEndPosition)
            
        }
    }
    
    public init(presentOn view: UIView, config: RONotificationProgressBarBannerConfiguration) {
        
        super.init(presentOn: view, config: config)
        self.type = RONotificationType.progress
    }
    
    public init(presentOn controller: UIViewController, config: RONotificationProgressBarBannerConfiguration) {
        
        super.init(presentOn: controller.view, config: config)
        self.type = RONotificationType.progress
    }
}
