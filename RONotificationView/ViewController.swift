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

    @IBAction func showBanner(_ sender: Any) {
        if(isNotificationVisible && (statusBarBanner != nil) && statusBarBanner.isVisiable){
            statusBarBanner.hideBanner(completion: { [weak self] in
                self?.isNotificationVisible = self?.messageBanner?.isVisiable ?? false || self?.customBanner?.isVisiable ?? false
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
        if(isNotificationVisible && (messageBanner != nil) && messageBanner.isVisiable){
            messageBanner.hideBanner(completion: { [weak self] in
                self?.isNotificationVisible = self?.customBanner?.isVisiable ?? false || self?.statusBarBanner?.isVisiable ?? false
            })
        }else{
            let configuration = RONotificationMessageConfiguration(title: "Message Banner Title", message: "Message Banner Text")
            if messageBanner == nil {
                messageBanner = RONotificationMessageBanner(configuration)
            }
            messageBanner.showBanner()
            isNotificationVisible = true
        }
        
    }
    
    @IBAction func customBanner(_ sender: UIButton) {
        
        if(isNotificationVisible && (customBanner != nil) && customBanner.isVisiable){
            customBanner.hideBanner(completion: { [weak self] in
                self?.isNotificationVisible = self?.messageBanner?.isVisiable ?? false || self?.statusBarBanner?.isVisiable ?? false
            })
        }else{
            if customBanner == nil {
                let nib = Bundle.main.loadNibNamed("CustomView", owner: self, options: nil)
                let view = (nib?.first as? UIView)! as! CustomView
                let configuration = RONotificationCustomViewConfiguration(duration: 2)
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
        
        let progressBarConfiguration = RONotificationProgressBarBannerConfiguration(progressBarColor: UIColor.blue, progressBarStartPosition: 0, progressBarEndPosition: 100)
        let progressBar = RONotificationProgressBarBanner(progressBarConfiguration)
        var current:Float = 0
        
//        var gl = CAGradientLayer()
//        gl.colors = [UIColor.white.cgColor, UIColor.black.cgColor]
//        progressBarConfiguration.progressBarGradient = gl
        
        progressBar.showBanner()
        isNotificationVisible = true
        progressBar.updateProgressBarTo(position: 50)
//        Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { (_) in
//            progressBar.updateProgressBarTo(position: current + 5.3)
//            current += 5.3
//        }
        
    }
    override var prefersStatusBarHidden: Bool {
        
        return isNotificationVisible
    }
}


