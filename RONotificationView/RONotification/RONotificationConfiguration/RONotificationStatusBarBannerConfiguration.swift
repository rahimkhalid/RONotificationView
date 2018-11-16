//
//  RONotificationStatusBarBannerConfiguration.swift
//  RONotificationView
//
//  Created by rahim on 11/12/18.
//  Copyright © 2018 RO. All rights reserved.
//

import Foundation
import UIKit

public class RONotificationStatusBarBannerConfiguration: RONotificationConfiguration {
    
    public var isToAnimateView: Bool
    public var duration: TimeInterval
    public var messageTextColor: UIColor
    public var backgroundColor: UIColor
    public var message: String
    public var messageFont: UIFont
    
    init(message: String,
         isToAnimateView: Bool = false) {
        
        self.messageFont = UIFont.systemFont(ofSize: 11, weight: .bold)
        self.duration = 0
        self.messageTextColor = UIColor.white
        self.backgroundColor = UIColor.darkGray
        self.message = message
        self.isToAnimateView = isToAnimateView
    }
    
}
