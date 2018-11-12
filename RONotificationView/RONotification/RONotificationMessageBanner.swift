//
//  RONotificationMessageBanner.swift
//  RONotificationView
//
//  Created by rahim on 11/12/18.
//  Copyright © 2018 RO. All rights reserved.
//

import Foundation
import UIKit

class RONotificationMessageBanner: RONotificationView{
    
    var configuration: RONotificationConfiguration
    var bannerView: UIView?
    private weak var window:UIWindow? = {
        return UIApplication.shared.keyWindow
    }()
    
    init(_ config: RONotificationMessageConfiguration) {
        self.configuration = config
    }
    
    func showBanner() {
        bannerView = RONotificationManager.getNotificationBarConfiguration(for: .message,configuration: self.configuration)
        let height:CGFloat = 78
        
        bannerView?.frame = CGRect(x: 0, y: 20, width: UIScreen.main.bounds.width, height: height)
        window?.addSubview(bannerView!)
        
        UIView.animate(withDuration: 0.3) {
            self.bannerView?.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: height)
        }
    }
    
    func hideBanner() {
        UIView.animate(withDuration: 0.3) {
            self.bannerView?.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        }
        
        bannerView?.removeFromSuperview()
    }
    
}
