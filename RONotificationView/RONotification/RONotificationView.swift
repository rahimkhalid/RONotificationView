//
//  RONotificationView.swift
//  RONotificationView
//
//  Created by rahim on 11/12/18.
//  Copyright © 2018 RO. All rights reserved.
//

import Foundation
import UIKit

class RONotificationView {
    
    var configuration: RONotificationConfiguration
    var bannerView: UIView?
    internal var type:RONotificationType?
    private var isVisiable = false
    
    internal weak var window:UIWindow? = {
        return UIApplication.shared.keyWindow
    }()
    
    init(config: RONotificationConfiguration) {
        configuration = config
        setupNotificationForRotation()
    }
    
    func setupNotificationForRotation() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(handleRotation),
                                               name: NSNotification.Name.UIDeviceOrientationDidChange,
                                               object: nil)
    }
    
    @objc private func handleRotation() {
        if isVisiable{
            showBanner()
        }
        
    }
    
    func showBanner() {
        if bannerView == nil{
            bannerView = RONotificationManager.getNotificationBarConfiguration(for: type!,configuration: self.configuration)
        }
        
        guard let banner = bannerView else {
            return
        }
        
        isVisiable = true
        
        banner.frame = CGRect(x: 0, y: -(banner.getHeight()), width: UIScreen.main.bounds.width, height: banner.getHeight())
        window?.addSubview(banner)
        
        UIView.animate(withDuration: 0.3, animations: {[weak self] in
            
            guard let weakSelf = self,
                let banner = weakSelf.bannerView  else {
                    return
            }
            banner.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: banner.getHeight())
            
        }){ [weak self] (_) in
            
            guard let weakSelf = self else {
                return
            }
            if !weakSelf.configuration.duration.isLessThanOrEqualTo(0){
                weakSelf.hideBanner(withDelay: weakSelf.configuration.duration, completion: nil)
            }
        }
        
    }
    
    private func hideBanner(withDelay duration: TimeInterval, completion: (() -> Void)?) {
        
        isVisiable = false
        UIView.animateKeyframes(withDuration: 0.3, delay: duration, animations: {[weak self] in
            
            guard let weakSelf = self,
                let banner = weakSelf.bannerView else {
                    return
            }
            banner.frame = CGRect(x: 0, y: -(banner.getHeight()), width: UIScreen.main.bounds.width, height: banner.getHeight())
            
        }) { [weak self] (_) in
            
            guard let weakSelf = self else {
                return
            }
            weakSelf.bannerView?.removeFromSuperview()
            completion?()
        }
    }
    
    func hideBanner(completion: @escaping () -> Void) {

        hideBanner(withDelay: 0) {
            completion()
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
}
