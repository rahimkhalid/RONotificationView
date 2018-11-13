//
//  RONotificationStatusBarBannerConfiguration.swift
//  RONotificationView
//
//  Created by rahim on 11/12/18.
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
    
    init(message: String) {
        
        self.messageFont = UIFont.systemFont(ofSize: 11, weight: .bold)
        self.duration = -1
        self.messageTextColor = UIColor.white
        self.backgroundColor = UIColor.darkGray
        self.message = message
    }
    
}
