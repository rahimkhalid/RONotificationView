//
//  RONotificationProgressBarBanner.swift
//  RONotificationView
//
//  Created by vd-rahim on 11/14/18.
//  Copyright © 2018 RO. All rights reserved.
//

import Foundation

class RONotificationProgressBarBanner: RONotificationView{
    
    init(_ config: RONotificationProgressBarBannerConfiguration) {
        super.init(config: config)
        self.type = RONotificationType.progress
    }
    
    func updateProgressBarTo(position: Float){
        (configuration as! RONotificationProgressBarBannerConfiguration).setCurrentProgress(progress: position)
        (bannerView as! RONotificationProgressBarBannerView).animateProgressBarTo(position: position > 100 ? 100 : position, final: configuration.progressBarEndPosition!)
    }
}
