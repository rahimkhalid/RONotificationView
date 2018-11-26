//
//  RONotificationViewProgressBannerDemo.swift
//  RONotificationView
//
//  Created by vd-rahim on 11/25/18.
//  Copyright © 2018 RO. All rights reserved.
//

import Foundation
import UIKit

class RONotificationViewProgressBannerDemo: UIViewController {
    
    let colors:[UIColor] = [UIColor.white, UIColor.black, UIColor.blue, UIColor.brown, UIColor.cyan, UIColor.darkGray, UIColor.green, UIColor.magenta, UIColor.orange, UIColor.purple, UIColor.red]
    
    @IBOutlet weak var animateSwitch: UISwitch!
    @IBOutlet weak var showCountSwitch: UISwitch!
    @IBOutlet weak var endTxtField: UITextField!
    @IBOutlet weak var startTxtField: UITextField!
    @IBOutlet weak var progressBarColorSlider: UISlider!
    @IBOutlet weak var backgroundColorSlider: UISlider!
    @IBOutlet weak var countColorSlider: UISlider!
    @IBOutlet weak var configurationView: UIView!
    
    
    var windowTimer:Timer? = nil
    var viewTimer:Timer? = nil
    var controllerTimer:Timer? = nil
    
    var windowBanner: RONotificationProgressBarBanner!
    var controllerBanner: RONotificationProgressBarBanner!
    var viewBanner: RONotificationProgressBarBanner!
    var configuration: RONotificationProgressBarBannerConfiguration!
    
    override func viewDidLoad() {
        configuration = RONotificationProgressBarBannerConfiguration(progressBarColor: colors[Int(backgroundColorSlider.value)], progressBarStartPosition: 0, progressBarEndPosition: 100, isToAnimateView: true)
    }
    
    func createConfiguration(){

        configuration.backgroundColor = colors[Int(backgroundColorSlider.value)]
        configuration.isToAnimateView = true
        configuration.isToShowProgressCount = showCountSwitch.isOn
        configuration.progressBarColor = colors[Int(progressBarColorSlider.value)]
        configuration.progressCountColor = colors[Int(countColorSlider.value)]
        configuration.progressBarStartPosition = (startTxtField.text! as NSString).floatValue
        configuration.progressBarEndPosition = (endTxtField.text! as NSString).floatValue
        configuration.progressBarCurrentPosition = (startTxtField.text! as NSString).floatValue
        configuration.isToAnimateProgressBarGradient = animateSwitch.isOn
    }
    
    @IBAction func showBannerOnWindow(_ sender: UIButton) {
        if windowBanner == nil{
            windowBanner = RONotificationProgressBarBanner(configuration)
        }
        
        //For demo purpose.
        var current:Float = 0
        
        if windowBanner.isVisiable {
            
        }else{
            createConfiguration()
            windowBanner.updateConfiguration(config: configuration)
            
            windowBanner.showBanner(onDismiss: nil, onTap: nil) {[weak self] in
                self?.windowTimer?.invalidate()
                self?.windowTimer = nil
                self?.windowBanner.hideBanner()
                
            }
        
            windowTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self](_) in
                if current + 5 < 100{
                    self?.windowBanner.updateProgressBarTo(position: current + 5)
                }else{
                    self?.windowBanner.updateProgressBarTo(position: 100)
                    
                }
                current += 5.3
            }
        }
        
    }
    @IBAction func showBannerOnView(_ sender: UIButton) {
        if viewBanner == nil{
            viewBanner = RONotificationProgressBarBanner(presentOn: configurationView, config: configuration)
        }
        
        //For demo purpose.
        var current:Float = 0
        
        if viewBanner.isVisiable {
            
        }else{
            createConfiguration()
            viewBanner.updateConfiguration(config: configuration)
            
            viewBanner.showBanner(onDismiss: nil, onTap: nil) {[weak self] in
                self?.viewTimer?.invalidate()
                self?.viewTimer = nil
                self?.viewBanner.hideBanner()
                
            }
            
            viewTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self](_) in
                if current + 5 < 100{
                    self?.viewBanner.updateProgressBarTo(position: current + 5)
                }else{
                    self?.viewBanner.updateProgressBarTo(position: 100)
                    
                }
                current += 5.3
            }
        }
    }
    
    @IBAction func showBannerOnController(_ sender: UIButton) {
        if controllerBanner == nil{
            controllerBanner = RONotificationProgressBarBanner(presentOn: self, config: configuration)
        }
        
        //For demo purpose.
        var current:Float = 0
        
        if controllerBanner.isVisiable {
            
        }else{
            createConfiguration()
            controllerBanner.updateConfiguration(config: configuration)
            
            controllerBanner.showBanner(onDismiss: nil, onTap: nil) {[weak self] in
                self?.controllerTimer?.invalidate()
                self?.controllerTimer = nil
                self?.controllerBanner.hideBanner()
                
            }
            
            controllerTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self](_) in
                if current + 5 < 100{
                    self?.controllerBanner.updateProgressBarTo(position: current + 5)
                }else{
                    self?.controllerBanner.updateProgressBarTo(position: 100)
                    
                }
                current += 5.3
            }
        }
    }
}
