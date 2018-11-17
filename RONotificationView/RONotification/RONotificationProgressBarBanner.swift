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
        self.type = .Progress
    }
    
    public func updateProgressBarTo(position: Float){
        if let config = configuration as? RONotificationProgressBarBannerConfiguration,
            let banner = bannerView as? RONotificationProgressBarBannerView {
                
            config.setCurrentProgress(progress: position)
            let current = position > 100 ? 100 : position
            
            banner.animateProgressBarTo(position: current, final: config.progressBarEndPosition, completion: { [weak self](pos) in
                if pos == config.progressBarEndPosition{
                    self?.onCompleted?()
                }
            })
            
        }
    }
    
    public init(presentOn view: UIView, config: RONotificationProgressBarBannerConfiguration) {
        
        super.init(presentOn: view, config: config)
        self.type = .Progress
        self.presenterType = .View
    }
    
    public init(presentOn controller: UIViewController, config: RONotificationProgressBarBannerConfiguration) {
        
        super.init(presentOn: controller.view, config: config)
        self.type = .Progress
        self.presenterType = .Controller
    }
}
