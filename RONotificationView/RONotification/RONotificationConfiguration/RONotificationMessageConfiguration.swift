//
//  RONotificationMessageConfiguration.swift
//  RONotificationView
//
//  Created by rahim on 11/12/18.
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
    
    init(title: String,
         message: String) {
        
        self.messageFont = UIFont.systemFont(ofSize: 11, weight: .regular)
        self.titleFont = UIFont.systemFont(ofSize: 11, weight: .bold)
        self.duration = 0
        self.titleTextColor = UIColor.white
        self.messageTextColor = UIColor.white
        self.backgroundColor = UIColor.darkGray
        self.image = UIImage()
        self.isDragable = false
        self.title = title
        self.message = message
        self.isToShowLoader = false
        
    }
    
}
