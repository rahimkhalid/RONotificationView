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
    private(set) var isVisiable = false
    private var onDismiss: (() -> ())?
    
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
        print("testing")
        if isVisiable{
            
            if let banner = bannerView{
                setupFrames(for: banner , y: 0, height: banner.getHeight())
            }
            
        }
    }
    
    func setupFrames(for banner:UIView, y:CGFloat,height:CGFloat){
        banner.frame = CGRect(x: 0, y: y, width: UIScreen.main.bounds.width, height: height)
        if type == RONotificationType.progress{
            (self as! RONotificationProgressBarBanner).updateProgressBarTo(position: configuration.progressBarCurrentPosition ?? 0 )
        }
    }
    
    func showBanner(onDismiss: (() -> ())? = nil) {
        
        self.onDismiss = onDismiss
        
        if bannerView == nil{
            bannerView = RONotificationManager.getNotificationBarConfiguration(for: type!,configuration: self.configuration)
        }
        isVisiable = true
        
        guard let banner = bannerView else { return }
        setupFrames(for: banner, y: -banner.getHeight(), height: banner.getHeight())
        window?.addSubview(banner)
        
        UIView.animate(withDuration: 0.3, animations: {[weak self] in
            
            guard let weakSelf = self ,
                let banner = weakSelf.bannerView  else { return }
            
            weakSelf.setupFrames(for: banner, y: 0, height: banner.getHeight())
            
        }){ [weak self] (_) in
            
            guard let weakSelf = self else { return }
            weakSelf.hideBannerAfter(weakSelf.configuration.duration ?? 0)
        }
    }
    
    func hideBannerAfter(_ time:TimeInterval){
        if !time.isLessThanOrEqualTo(0){
            DispatchQueue.main.asyncAfter(deadline: .now() + time, execute: {[weak self] in
                self?.hideBanner(completion: {
                    self?.onDismiss?()
                })
            })
        }
    }
    
    func hideBanner(completion: @escaping () -> Void) {

        UIView.animate(withDuration: 0.3, animations: {[weak self] in
            guard let weakSelf = self,
                let banner = weakSelf.bannerView else {
                    return
            }
            weakSelf.setupFrames(for: banner, y: -(banner.getHeight()), height: banner.getHeight())
        }) { [weak self](_) in
            guard let weakSelf = self else {
                return
            }
            weakSelf.isVisiable = false
            
            weakSelf.bannerView?.removeFromSuperview()
            completion()
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
}
