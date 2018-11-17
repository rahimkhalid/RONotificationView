//
//  ViewController.swift
//  RONotificationView
//
//  Created by rahim on 11/12/18.
//  Copyright © 2018 RO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var statusBarBanner:RONotificationView!
    var messageBanner:RONotificationView!
    var customBanner: RONotificationView!
    var progressBar: RONotificationProgressBarBanner!
    
    @IBOutlet weak var testView: UIView!
    private var isNotificationVisible = false {
        didSet {
            UIView.animate(withDuration: 0.3) {
                self.setNeedsStatusBarAppearanceUpdate()
            }
        }
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation{
        return .slide
    }
    
    func isAnyNotificationVisible() -> Bool{
        return customBanner?.isVisiable ?? false || statusBarBanner?.isVisiable ?? false || messageBanner?.isVisiable ?? false || progressBar?.isVisiable ?? false
    }

    @IBAction func showBanner(_ sender: Any) {
        if(isNotificationVisible && statusBarBanner?.isVisiable ?? false){
            statusBarBanner.hideBanner(completion: { [weak self] in
                self?.isNotificationVisible = self?.isAnyNotificationVisible() ?? false
            })
        }else{
            let configuration = RONotificationStatusBarBannerConfiguration(message: "Testing")
            if statusBarBanner == nil {
                statusBarBanner = RONotificationStatusBarBanner(configuration)
            }
            statusBarBanner.showBanner()
            isNotificationVisible = true
        }
        
    }
    
    @IBAction func messageBanner(_ sender: Any) {
        if(isNotificationVisible && messageBanner?.isVisiable ?? false){
            messageBanner.hideBanner(completion: { [weak self] in
                self?.isNotificationVisible = self?.isAnyNotificationVisible() ?? false
            })
        }else{
            let configuration = RONotificationMessageConfiguration(title: "Message Banner Title", message: "Message Banner Text")
            if messageBanner == nil {
                messageBanner = RONotificationMessageBanner(configuration)
            }
            messageBanner.showBanner(onDismiss: {
                
            }, onTap: {[weak self] in
                self?.messageBanner.hideBanner()
                self?.isNotificationVisible = self?.isAnyNotificationVisible() ?? false
            }) {
                
            }
            isNotificationVisible = true
        }
        
    }
    
    @IBAction func customBanner(_ sender: UIButton) {
        
        if(isNotificationVisible && customBanner?.isVisiable ?? false){
            customBanner.hideBanner(completion: { [weak self] in
                self?.isNotificationVisible = self?.isAnyNotificationVisible() ?? false
            })
        }else{
            if customBanner == nil {
                let nib = Bundle.main.loadNibNamed("CustomView", owner: self, options: nil)
                let view = (nib?.first as? UIView)! as! CustomView
                let configuration = RONotificationCustomViewConfiguration(duration: 4)
                customBanner = RONotificationCustomBanner(configuration: configuration, customView: view)
            }
            customBanner.showBanner {[weak self] in
                self?.customBanner.hideBanner(completion: { [weak self] in
                    self?.isNotificationVisible = self?.messageBanner?.isVisiable ?? false || self?.statusBarBanner?.isVisiable ?? false
                })
            }
            isNotificationVisible = true
        }
    }
    
    @IBAction func switchScreen(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func progressBanner(_ seROnder: UIButton) {
        
        let bgColor = UIColor(red: 0.8, green: 0.1, blue: 0.3, alpha: 1.0)
        let progressBarConfiguration = RONotificationProgressBarBannerConfiguration(progressBarColor: bgColor, progressBarStartPosition: 0, progressBarEndPosition: 100)
        
        progressBar = RONotificationProgressBarBanner(progressBarConfiguration)
        progressBarConfiguration.isToShowProgressCount = true
        progressBarConfiguration.isToAnimateProgressBarGradient = true
        
        //For demo purpose.
        var current:Float = 0
        var timer:Timer? = nil
        
        progressBar.showBanner(onDismiss: {
            
        }, onTap: {
            
        }) {[weak self] in
            timer?.invalidate()
            timer = nil
            self?.progressBar.hideBanner()
            self?.isNotificationVisible = self?.isAnyNotificationVisible() ?? false
        }
        
        isNotificationVisible = true
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self](_) in
            self?.progressBar.updateProgressBarTo(position: current + 5)
            current += 5.3
        }
        
    }
    override var prefersStatusBarHidden: Bool {
        
        return isNotificationVisible
    }
}


