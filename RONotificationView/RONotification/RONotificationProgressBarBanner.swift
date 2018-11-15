//
//  RONotificationProgressBarBanner.swift
//  RONotificationView
//
//  Created by vd-rahim on 11/14/18.
//  Copyright © 2018 RO. All rights reserved.
//

import Foundation

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
}
