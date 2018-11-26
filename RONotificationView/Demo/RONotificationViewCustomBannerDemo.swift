//
//  RONotificationViewCustomBannerDemo.swift
//  RONotificationView
//
//  Created by vd-rahim on 11/25/18.
//  Copyright © 2018 RO. All rights reserved.
//

import Foundation
import UIKit

class RONotificationViewCustomBannerDemo: UIViewController {
    
    @IBOutlet weak var animateSwitch: UISwitch!
    @IBOutlet weak var duration: UITextField!
    @IBOutlet weak var configurationView: UIView!
    
    var customView: UIView!
    
    var windowBanner: RONotificationView!
    var controllerBanner: RONotificationView!
    var viewBanner: RONotificationView!
    var configuration: RONotificationCustomViewConfiguration!
    
    override func viewDidLoad() {
        configuration = RONotificationCustomViewConfiguration(duration: (duration.text! as NSString).doubleValue, isToAnimateView: animateSwitch.isOn)
        let nib = Bundle.main.loadNibNamed("CustomView", owner: self, options: nil)
        customView = (nib?.first as? UIView)! as! CustomView
    }
    
    func createConfiguration(){
        
        configuration.isToAnimateView = true
        configuration.duration = (duration.text! as NSString).doubleValue
    }
    
    @IBAction func showBannerOnWindow(_ sender: UIButton) {
        if windowBanner == nil{
            windowBanner = RONotificationCustomBanner(configuration: configuration, customView: customView)
        }
        
        if windowBanner.isVisiable {
            
        }else{
            createConfiguration()
            windowBanner.updateConfiguration(config: configuration)
            
            windowBanner.showBanner()
        }
        
    }
    @IBAction func showBannerOnView(_ sender: UIButton) {
        if viewBanner == nil{
            viewBanner = RONotificationCustomBanner(presentOn: configurationView, config: configuration, customView:customView)
        }
        
        if viewBanner.isVisiable {
            
        }else{
            createConfiguration()
            viewBanner.updateConfiguration(config: configuration)
            
            viewBanner.showBanner()
        }
    }
    
    @IBAction func showBannerOnController(_ sender: UIButton) {
        if controllerBanner == nil{
            controllerBanner = RONotificationCustomBanner(presentOn: self, config: configuration, customView:customView)
        }
        
        if controllerBanner.isVisiable {
            
        }else{
            createConfiguration()
            controllerBanner.updateConfiguration(config: configuration)
            
            controllerBanner.showBanner()
            
        }
    }
}
