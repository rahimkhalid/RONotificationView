//
//  RONotificationProgressBarBanner.swift
//  RONotificationView
//
//  Created by rahim on 11/14/18.
//  Copyright © 2018 RO. All rights reserved.
//

import Foundation
import UIKit

/// RONV: 'RONotificationProgressBarBanner' This is a child class for 'RONotificationView' basically used for setting up ProgressBar banner.
public class RONotificationProgressBarBanner: RONotificationView{
    
    internal var isCompletedCalled = false
    
    /// RONV: This init is called when presenter is used to be set as window.
    /// RONV: It sets type on parent class as progress and
    /// RONV: No need to set PresenterType as default is window.
    init(_ config: RONotificationProgressBarBannerConfiguration) {
        super.init(config: config)
        self.type = .progress
    }
    
    /// RONV: called for updating the current progressBar position,
    /// RONV: also check if current position is greater than setted end position.
    /// RONV: If current position is greater than end position OnCompletedProgress handler called.
    public func updateProgressBarTo(position: Float){
        if let config = configuration as? RONotificationProgressBarBannerConfiguration,
            let banner = bannerView as? RONotificationProgressBarBannerView {
                
            config.setCurrentProgress(progress: position)
            let current = position > config.progressBarEndPosition ? config.progressBarEndPosition : position
            
            banner.animateProgressBarTo(position: current, final: config.progressBarEndPosition, completion: { [weak self](pos) in
                if pos == config.progressBarEndPosition && !(self?.isCompletedCalled)!{
                    self?.isCompletedCalled = true
                    self?.onCompleted?()
                }
            })
            
        }
    }
    
    /// RONV: This init is called when presenter is used to be set as UIView.
    /// RONV: It sets type on parent class as progress and
    /// RONV: need to set PresenterType as view.
    public init(presentOn view: UIView, config: RONotificationProgressBarBannerConfiguration) {
        
        super.init(presentOn: view, config: config)
        self.type = .progress
        self.presenterType = .view
    }
    
    /// RONV: This init is called when presenter is used to be set as Controller.
    /// RONV: It sets type on parent class as progress and
    /// RONV: need to set PresenterType as Controller.
    public init(presentOn controller: UIViewController, config: RONotificationProgressBarBannerConfiguration) {
        
        super.init(presentOn: controller.view, config: config)
        self.type = .progress
        self.presenterType = .controller
    }
}
