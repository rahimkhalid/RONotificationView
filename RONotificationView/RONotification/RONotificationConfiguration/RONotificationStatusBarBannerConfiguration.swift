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
    
    var duration: TimeInterval
    var messageTextColor: UIColor
    var backgroundColor: UIColor
    var message: String
    var messageFont: UIFont
    
    init(messageFont:UIFont = UIFont.systemFont(ofSize: 11),
         duration: TimeInterval = -1,
         messageTextColor: UIColor,
         backgroundColor: UIColor,
         message: String) {
        
        self.messageFont = messageFont
        self.duration = duration
        self.messageTextColor = messageTextColor
        self.backgroundColor = backgroundColor
        self.message = message
    }
    
}
