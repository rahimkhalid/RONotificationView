//
//  RONotificationMessageConfiguration.swift
//  RONotificationView
//
//  Created by vd-rahim on 11/12/18.
//  Copyright © 2018 RO. All rights reserved.
//

import Foundation
import UIKit

class RONotificationMessageConfiguration: RONotificationConfiguration {
    
    var messageFont: UIFont
    var titleFont: UIFont
    var duration: TimeInterval
    var titleTextColor: UIColor
    var messageTextColor: UIColor
    var backgroundColor: UIColor
    var image: UIImage
    var isDragable: Bool
    var title: String
    var message: String
    var isToShowLoader: Bool
    
    init(messageFont:UIFont = UIFont.systemFont(ofSize: 11),
         titleFont:UIFont = UIFont.systemFont(ofSize: 11, weight: .bold),
         duration: TimeInterval = -1,
         messageTextColor: UIColor,
         titleTextColor: UIColor,
         backgroundColor: UIColor,
         image: UIImage = UIImage(),
         isDragable: Bool = false,
         title: String,
         message: String,
         isToShowLoader: Bool = false) {
        
        self.messageFont = messageFont
        self.titleFont = titleFont
        self.duration = duration
        self.titleTextColor = titleTextColor
        self.messageTextColor = messageTextColor
        self.backgroundColor = backgroundColor
        self.image = image
        self.isDragable = isDragable
        self.title = title
        self.message = message
        self.isToShowLoader = isToShowLoader
        
    }
    
}
