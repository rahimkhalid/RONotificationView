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
    private(set) var onTap: (() -> ())?
    private(set) var onCompleted: (() -> ())?
    
    private(set) lazy var animationDuration: TimeInterval = {
        return configuration.isToAnimateView ? 0.3 : 0
    }()
    internal var presenterType: RONotificationPresenterType = .Window
    private var timer: Timer?
    
    internal weak var presenter:UIView? = UIApplication.shared.keyWindow
    
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
                
                let y = type?.getTopSpacing(for: presenterType) ?? 0
                setupFrames(for: banner , y: y, height: banner.getHeight())
                banner.superview?.layoutIfNeeded()
            }
            
        }
    }
    
    private func setupFrames(for banner:UIView, y:CGFloat,height:CGFloat){
        
        let cHeight = banner.getHeight() + (type?.getExtraHeightForBanner(with: presenterType) ?? 0)
        
        banner.frame = CGRect(x: 0, y: y, width: UIScreen.main.bounds.width, height: cHeight)
        if type == .Progress{
            if let progressBanner = self as? RONotificationProgressBarBanner{
                
                let position = configuration.progressBarCurrentPosition ?? 0
                progressBanner.updateProgressBarTo(position: position)
            }
        }
    }
    
    public func showBanner(onDismiss: (() -> ())? = nil, onTap: (() -> ())? = nil, onProgressCompleted: (() -> ())? = nil) {
        
        self.onDismiss = onDismiss
        self.onCompleted = onProgressCompleted
        self.onTap = onTap
        
        if bannerView == nil{
            if let t = type {
                bannerView = RONotificationManager.getNotificationBar(for: t,configuration: self.configuration, delegate: self)
            }
        }
        
        isVisiable = true
        
        guard let banner = bannerView else { return }
        
        let y = type?.getTopSpacing(for: presenterType) ?? 0
        setupFrames(for: banner, y: -(banner.getHeight() + y), height: banner.getHeight())
        presenter?.addSubview(banner)
        
        UIView.animate(withDuration: animationDuration, animations: {[weak self] in
            
            guard let weakSelf = self ,
                let banner = weakSelf.bannerView  else { return }
            
            let y = weakSelf.type?.getTopSpacing(for: weakSelf.presenterType) ?? 0
            weakSelf.setupFrames(for: banner, y: y, height: banner.getHeight())
            
        }){ [weak self] (_) in
            
            guard let weakSelf = self else { return }
            weakSelf.hideBannerAfter(weakSelf.configuration.duration ?? 0)
        }
    }
    
    private func hideBannerAfter(_ time:TimeInterval){
        if !time.isLessThanOrEqualTo(0){
            
            timer = Timer.scheduledTimer(withTimeInterval: time, repeats: true) { [weak self](_) in
                guard let weakSelf = self else { return }
                if weakSelf.isVisiable {
                    self?.hideBanner(completion: {
                        self?.onDismiss?()
                    })
                }
            }
        }
    }
    
    public func hideBanner(completion: (() -> ())? = nil) {

        isVisiable = false
        timer?.invalidate()
        UIView.animate(withDuration: animationDuration, animations: {[weak self] in
            guard let weakSelf = self,
                let banner = weakSelf.bannerView else {
                    return
            }
            
            let y = weakSelf.type?.getTopSpacing(for: weakSelf.presenterType) ?? 0
            weakSelf.setupFrames(for: banner, y: -(banner.getHeight() + y), height: banner.getHeight())
        }) { [weak self](_) in
            guard let weakSelf = self else {
                return
            }
            
            weakSelf.bannerView?.removeFromSuperview()
            completion?()
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
}

extension RONotificationView : RONotificationViewDelegate{
    func didTappedNotificationBanner() {
        self.onTap?()
    }
}
