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
    
    var font: UIFont
    var duration: TimeInterval
    var textColor: UIColor
    var backgroundColor: UIColor
    var image: UIImage
    var isDragable: Bool
    var title: String
    var message: String
    var isToShowLoader: Bool
    
    init(font:UIFont = UIFont.systemFont(ofSize: 11),
         duration: TimeInterval = -1,
         textColor: UIColor,
         backgroundColor: UIColor,
         image: UIImage = UIImage(),
         isDragable: Bool = false,
         title: String,
         message: String,
         isToShowLoader: Bool = false) {
        
        self.font = font
        self.duration = duration
        self.textColor = textColor
        self.backgroundColor = backgroundColor
        self.image = image
        self.isDragable = isDragable
        self.title = title
        self.message = message
        self.isToShowLoader = isToShowLoader
        
    }
    
}
