//
//  RONotificationView.swift
//  RONotificationView
//
//  Created by rahim on 11/12/18.
//  Copyright © 2018 RO. All rights reserved.
//

import Foundation
import UIKit

/// RONV: RONotificationView is the base class for StatusBar, Message, ProgressBar and custom banner.

public class RONotificationView {
    
    /// RONV: require configuration for setting-up banner. (basically for custom design)
    internal var configuration: RONotificationConfiguration
    
    /// RONV: set according to user init base class.
    internal var bannerView: UIView?
    internal var type:RONotificationType?
    
    /// RONV: use to check is banner currently visible.
    private(set) var isVisiable = false
    
    /// RONV: completion handler for dismiss
    private(set) var onDismiss: (() -> ())?
    
    /// RONV: completion handler for tap on banner.
    private(set) var onTap: (() -> ())?
    
    /// RONV: completion handler for progress completed
    private(set) var onCompleted: (() -> ())?
    
    /// RONV: set animation duration based on user config i.e if setted to animate or not to.
    private(set) lazy var animationDuration: TimeInterval = {
        return configuration.isToAnimateView ? 0.3 : 0
    }()
    
    /// RONV: help to identify the presenter view (window as default, view , controller)
    internal var presenterType: RONotificationPresenterType = .window
    
    /// RONV: for duration based banners.
    private var timer: Timer?
    
    /// RONV: view where banner will be presented.
    internal weak var presenter:UIView? = UIApplication.shared.keyWindow
    
    //MARK: Initializing
    
    /// RONV: initializer with presenter and config.
    internal init(presentOn view:UIView?, config: RONotificationConfiguration) {
        configuration = config
        setupNotificationForRotation()
        self.presenter = view
    }
    
    /// RONV: If to present on window, this initializer will be called.
    internal init(config: RONotificationConfiguration) {
        configuration = config
        setupNotificationForRotation()
    }
    
    /// RONV: Used to setup notification for orientation change.
    private func setupNotificationForRotation() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(handleRotation),
                                               name: NSNotification.Name.UIDeviceOrientationDidChange,
                                               object: nil)
    }
    
    /// RONV: when orientation change this will be called.
    @objc private func handleRotation() {
        if isVisiable{
            if let banner = bannerView{
                
                let y = type?.getTopSpacing(for: presenterType) ?? 0
                setupFrames(for: banner , y: y, height: banner.getHeight())
                banner.superview?.layoutIfNeeded()
            }
            
        }
    }
    
    /// RONV: on every time orientation change or view need to be presented or dismiss this will be called to update frames.
    private func setupFrames(for banner:UIView, y:CGFloat,height:CGFloat){
        
        let cHeight = banner.getHeight() + (type?.getExtraHeightForBanner(with: presenterType) ?? 0)
        
        banner.frame = CGRect(x: 0, y: y, width: UIScreen.main.bounds.width, height: cHeight)
        if type == .progress{
            if let progressBanner = self as? RONotificationProgressBarBanner{
                
                let position = configuration.progressBarCurrentPosition ?? 0
                progressBanner.updateProgressBarTo(position: position)
            }
        }
    }
    
    /// RONV: Show banner will be used for the purpose of showing banner and dismiss, tap and progress completed completion will be set based on user requirement.
    /// RONV: ONDismiss handler will be called when banner need to be dismiss after duration,
    /// RONV: ONTap handler will be called when user tap on the banner
    /// RONV: progressCompleted handler will be called when progress bar will be completed.
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
    
    /// RONV: It takes duration time as argument and call hide banner after that interval.
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
    
    /// RONV: This hides banner.
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
    /// RONV: When user tap on banner internal delegate called, leads to onTap completion handler.
    func didTappedNotificationBanner() {
        self.onTap?()
    }
}
