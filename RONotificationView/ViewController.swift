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
            isNotificationVisible = false
            statusBarBanner.hideBanner()
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
        if(isNotificationVisible){
            isNotificationVisible = false
            messageBanner.hideBanner()
        }else{
            let configuration = RONotificationMessageConfiguration(title: "Message Banner Title", message: "Message Banner Text")
            if messageBanner == nil {
                messageBanner = RONotificationMessageBanner(configuration)
            }
            messageBanner.showBanner()
            isNotificationVisible = true
        }
        
    }
    override var prefersStatusBarHidden: Bool {
        
        return isNotificationVisible
    }
}


