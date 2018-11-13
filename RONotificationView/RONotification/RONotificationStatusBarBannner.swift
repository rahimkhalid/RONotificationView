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
    
    var configuration: RONotificationConfiguration
    var bannerView: UIView?
    private weak var window:UIWindow? = {
        return UIApplication.shared.keyWindow
    }()
    private var statusBarHeight:CGFloat = {
        return UIApplication.shared.statusBarFrame.size.height
    }()
    
    init(_ config: RONotificationStatusBarBannerConfiguration) {
        
        self.configuration = config
    }
    
    func showBanner() {
        if bannerView == nil {
            bannerView = RONotificationManager.getNotificationBarConfiguration(for: .onStatusBar,configuration: configuration)
        }
        
        let height:CGFloat = statusBarHeight
        
        bannerView?.frame = CGRect(x: 0, y: 20, width: UIScreen.main.bounds.width, height: height)
        window?.addSubview(bannerView!)
        
        UIView.animate(withDuration: 0.3) {[weak self] in
            
            guard let weakSelf = self else {
                return
            }
            weakSelf.bannerView?.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: height)
        }
    }
    
    func hideBanner() {
        UIView.animate(withDuration: 0.3) {[weak self] in
            
            guard let weakSelf = self else {
                return
            }
            weakSelf.bannerView?.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        }
        
        bannerView?.removeFromSuperview()
    }
}
