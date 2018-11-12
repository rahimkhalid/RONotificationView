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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    @IBAction func showBanner(_ sender: Any) {
        if(isNotificationVisible){
            isNotificationVisible = false
            statusBarBanner.hideBanner()
        }else{
            isNotificationVisible = true
            let configuration = RONotificationStatusBarBannerConfiguration(textColor: UIColor.white, backgroundColor: UIColor.gray, message: "Testing")
            
            statusBarBanner = RONotificationStatusBarBanner(configuration)
            statusBarBanner.showBanner()
        }
        
        
    }
    
    @IBAction func messageBanner(_ sender: Any) {
        if(isNotificationVisible){
            isNotificationVisible = false
            messageBanner.hideBanner()
        }else{
            isNotificationVisible = true
            let configuration = RONotificationMessageConfiguration(textColor: UIColor.white, backgroundColor: UIColor.gray, title: "Message Banner Title", message: "Message Banner Text")
            messageBanner = RONotificationMessageBanner(configuration)
            messageBanner.showBanner()
        }
        
    }
    override var prefersStatusBarHidden: Bool {
        
        return isNotificationVisible
    }
    
    
    
}


