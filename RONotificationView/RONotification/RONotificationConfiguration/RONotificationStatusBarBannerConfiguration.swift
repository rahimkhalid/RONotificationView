//
//  RONotificationStatusBarBannerConfiguration.swift
//  RONotificationView
//
//  Created by vd-rahim on 11/12/18.
//  Copyright © 2018 RO. All rights reserved.
//

import Foundation
import UIKit

class RONotificationStatusBarBannerConfiguration: RONotificationConfiguration {
    
    var font: UIFont
    var duration: TimeInterval
    var textColor: UIColor
    var backgroundColor: UIColor
    var message: String
    
    init(font:UIFont = UIFont.systemFont(ofSize: 11),
         duration: TimeInterval = -1,
         textColor: UIColor,
         backgroundColor: UIColor,
         message: String) {
        
        self.font = font
        self.duration = duration
        self.textColor = textColor
        self.backgroundColor = backgroundColor
        self.message = message
    }
    
}
