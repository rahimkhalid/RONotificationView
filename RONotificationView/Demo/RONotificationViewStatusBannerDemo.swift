//
//  RONotificationViewStatusBannerDemo.swift
//  RONotificationView
//
//  Created by vd-rahim on 11/25/18.
//  Copyright © 2018 RO. All rights reserved.
//

import Foundation
import UIKit

class RONotificationViewStatusBannerDemo: UIViewController {
    
    let colors:[UIColor] = [UIColor.white, UIColor.black, UIColor.blue, UIColor.brown, UIColor.cyan, UIColor.darkGray, UIColor.green, UIColor.magenta, UIColor.orange, UIColor.purple, UIColor.red]
    
    @IBOutlet weak var animateSwitch: UISwitch!
    @IBOutlet weak var durationTxtField: UITextField!
    @IBOutlet weak var messageTxtField: UITextField!
    @IBOutlet weak var textColorSlider: UISlider!
    @IBOutlet weak var backgroundColorSlider: UISlider!
    @IBOutlet weak var configurationView: UIView!

    var windowBanner: RONotificationView!
    var controllerBanner: RONotificationView!
    var viewBanner: RONotificationView!
    var configuration: RONotificationStatusBarBannerConfiguration!
    
    override func viewDidLoad() {
        configuration = RONotificationStatusBarBannerConfiguration(message: messageTxtField.text ?? "", isToAnimateView: animateSwitch.isOn)
    }
    
    func createConfiguration(){
        configuration.backgroundColor = colors[Int(backgroundColorSlider.value)]
        configuration.messageTextColor = colors[Int(textColorSlider.value)]
        configuration.message = messageTxtField.text ?? ""
        configuration.isToAnimateView = animateSwitch.isOn
        configuration.duration = ((durationTxtField.text ?? "0") as NSString).doubleValue
    }
    
    @IBAction func showBannerOnWindow(_ sender: UIButton) {
        if windowBanner == nil{
            windowBanner = RONotificationStatusBarBanner(configuration)
        }
        
        if windowBanner.isVisiable {
            windowBanner.hideBanner()
        }else{
            createConfiguration()
            windowBanner.updateConfiguration(config: configuration)
            
            windowBanner.showBanner()
        }
        
    }
    @IBAction func showBannerOnView(_ sender: UIButton) {
        if viewBanner == nil{
            viewBanner = RONotificationStatusBarBanner(presentOn: configurationView, config: configuration)
        }
        
        if viewBanner.isVisiable {
            viewBanner.hideBanner()
        }else{
            createConfiguration()
            viewBanner.updateConfiguration(config: configuration)
            
            viewBanner.showBanner()
        }
    }
    
    @IBAction func showBannerOnController(_ sender: UIButton) {
        if controllerBanner == nil{
            controllerBanner = RONotificationStatusBarBanner(presentOn: self, config: configuration)
        }
        
        if controllerBanner.isVisiable {
            controllerBanner.hideBanner()
        }else{
            createConfiguration()
            controllerBanner.updateConfiguration(config: configuration)
            
            controllerBanner.showBanner()
        }
    }
}
