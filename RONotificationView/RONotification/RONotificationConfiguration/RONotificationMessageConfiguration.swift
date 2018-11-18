//
//  RONotificationMessageConfiguration.swift
//  RONotificationView
//
//  Created by rahim on 11/12/18.
//  Copyright © 2018 RO. All rights reserved.
//

import Foundation
import UIKit

/// RONV: child class of RONotificationConfiguration for setting configuration of Message banner.
public class RONotificationMessageConfiguration: RONotificationConfiguration {
    
    public var isToAnimateView: Bool
    public var messageFont: UIFont
    public var titleFont: UIFont
    public var duration: TimeInterval
    public var titleTextColor: UIColor
    public var messageTextColor: UIColor
    public var backgroundColor: UIColor
    public var image: UIImage
    //public var isDragable: Bool
    public var title: String
    public var message: String
    public var isToShowLoader: Bool
    
    init(title: String,
         message: String,
         isToAnimateView: Bool = true) {
        
        self.messageFont = UIFont.systemFont(ofSize: 11, weight: .regular)
        self.titleFont = UIFont.systemFont(ofSize: 11, weight: .bold)
        self.duration = 0
        self.titleTextColor = UIColor.white
        self.messageTextColor = UIColor.white
        self.backgroundColor = UIColor.darkGray
        self.image = UIImage()
        //self.isDragable = false
        self.title = title
        self.message = message
        self.isToShowLoader = false
        self.isToAnimateView = isToAnimateView
        
    }
    
}
