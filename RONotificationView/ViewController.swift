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
        if(isNotificationVisible){
            statusBarBanner.hideBanner(completion: { [weak self] in
                self?.isNotificationVisible = false
            })
        }else{
            let configuration = RONotificationStatusBarBannerConfiguration(message: "Testing")
            configuration.duration = 4
            if statusBarBanner == nil {
                statusBarBanner = RONotificationStatusBarBanner(configuration)
            }
            statusBarBanner.showBanner()
            isNotificationVisible = true
        }
    }
    
    @IBAction func messageBanner(_ sender: Any) {
        if(isNotificationVisible){
            messageBanner.hideBanner(completion: { [weak self] in
                self?.isNotificationVisible = false
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
        
        if(isNotificationVisible){
            customBanner.hideBanner(completion: { [weak self] in
                self?.isNotificationVisible = false
            })
        }else{
            if customBanner == nil {
                let nib = Bundle.main.loadNibNamed("CustomView", owner: self, options: nil)
                let view = (nib?.first as? UIView)! as! CustomView
                let configuration = RONotificationCustomViewConfiguration(duration: 3)
                customBanner = RONotificationCustomBanner(configuration: configuration, customView: view)
            }
            customBanner.showBanner()
            isNotificationVisible = true
        }
    }
    
    @IBAction func progressBanner(_ sender: UIButton) {
        
    }
    override var prefersStatusBarHidden: Bool {
        
        return isNotificationVisible
    }
}


