//
//  RONotificationView.swift
//  RONotificationView
//
//  Created by rahim on 11/12/18.
//  Copyright © 2018 RO. All rights reserved.
//

import Foundation
import UIKit

public class RONotificationView {
    
    internal var configuration: RONotificationConfiguration
    internal var bannerView: UIView?
    internal var type:RONotificationType?
    private(set) var isVisiable = false
    private(set) var onDismiss: (() -> ())?
    private(set) lazy var animationDuration: TimeInterval = {
        return configuration.isToAnimateView ? 0.3 : 0
    }()
    
    internal weak var presenter:UIView? = UIApplication.shared.keyWindow
    
    internal lazy var safeAreaTopInset:CGFloat = {
        return presenter?.safeAreaInsets.top
    }()!
    
    public init(presentOn view:UIView?, config: RONotificationConfiguration) {
        configuration = config
        setupNotificationForRotation()
        self.presenter = view
    }
    
    public init(config: RONotificationConfiguration) {
        configuration = config
        setupNotificationForRotation()
    }
    
    private func setupNotificationForRotation() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(handleRotation),
                                               name: NSNotification.Name.UIDeviceOrientationDidChange,
                                               object: nil)
    }
    
    @objc private func handleRotation() {
        if isVisiable{
            if let banner = bannerView{
                
                var y:CGFloat = 0
                if UIDevice.current.orientation.isPortrait{
                    y = type == RONotificationType.progress ? safeAreaTopInset : 0
                }
                setupFrames(for: banner , y: y, height: banner.getHeight())
                banner.superview?.layoutIfNeeded()
            }
            
        }
    }
    
    private func setupFrames(for banner:UIView, y:CGFloat,height:CGFloat){
        
        var cHeight = banner.getHeight()
        if UIDevice.current.orientation.isPortrait && type != RONotificationType.progress{
            cHeight = cHeight + safeAreaTopInset
        }
        banner.frame = CGRect(x: 0, y: y, width: UIScreen.main.bounds.width, height: cHeight)
        if type == RONotificationType.progress{
            if let progressBanner = self as? RONotificationProgressBarBanner{
                
                let position = configuration.progressBarCurrentPosition ?? 0
                progressBanner.updateProgressBarTo(position: position)
            }
        }
    }
    
    public func showBanner(onDismiss: (() -> ())? = nil) {
        
        self.onDismiss = onDismiss
        
        if bannerView == nil{
            if let t = type {
                bannerView = RONotificationManager.getNotificationBarConfiguration(for: t,configuration: self.configuration)
            }
        }
        
        isVisiable = true
        
        guard let banner = bannerView else { return }
        setupFrames(for: banner, y: -(banner.getHeight() + safeAreaTopInset), height: banner.getHeight())
        presenter?.addSubview(banner)
        
        UIView.animate(withDuration: animationDuration, animations: {[weak self] in
            
            guard let weakSelf = self ,
                let banner = weakSelf.bannerView  else { return }
            var y:CGFloat = 0
            if UIDevice.current.orientation.isPortrait{
                y = weakSelf.type == RONotificationType.progress ? weakSelf.safeAreaTopInset : 0
            }
            
            
            weakSelf.setupFrames(for: banner, y: y, height: banner.getHeight())
            
        }){ [weak self] (_) in
            
            guard let weakSelf = self else { return }
            weakSelf.hideBannerAfter(weakSelf.configuration.duration ?? 0)
        }
    }
    
    private func hideBannerAfter(_ time:TimeInterval){
        if !time.isLessThanOrEqualTo(0){
            DispatchQueue.main.asyncAfter(deadline: .now() + time, execute: {[weak self] in
                guard let weakSelf = self else { return }
                if weakSelf.isVisiable {
                    self?.hideBanner(completion: {
                        self?.onDismiss?()
                    })
                }
            })
        }
    }
    
    public func hideBanner(completion: @escaping () -> Void) {

        isVisiable = false
        
        UIView.animate(withDuration: animationDuration, animations: {[weak self] in
            guard let weakSelf = self,
                let banner = weakSelf.bannerView else {
                    return
            }
            weakSelf.setupFrames(for: banner, y: -(banner.getHeight() + weakSelf.safeAreaTopInset), height: banner.getHeight())
        }) { [weak self](_) in
            guard let weakSelf = self else {
                return
            }
            
            weakSelf.bannerView?.removeFromSuperview()
            weakSelf.bannerView = nil
            completion()
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
}
