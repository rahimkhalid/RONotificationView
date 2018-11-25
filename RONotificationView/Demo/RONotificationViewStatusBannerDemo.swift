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
    
    override func viewDidLoad() {
        
    }
    
    @IBAction func showBannerOnWindow(_ sender: UIButton) {
        
    }
    @IBAction func showBannerOnView(_ sender: UIButton) {
        
    }
    @IBAction func showBannerOnController(_ sender: UIButton) {
        
    }
}
