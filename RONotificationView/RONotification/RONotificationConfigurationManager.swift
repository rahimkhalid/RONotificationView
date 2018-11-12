//
//  RONotificationConfigurationManager.swift
//  RONotificationView
//
//  Created by rahim on 11/12/18.
//  Copyright © 2018 RO. All rights reserved.
//

import Foundation
import UIKit

class RONotificationConfigurationManager {
    
    static func setupNotificationBarConfiguration(config:Dictionary<RONotificationStyle,Any>) -> RONotificationConfiguration{
        
        let title = config[.title] as? String
        let message = config[.message] as? String
        let backgroundColor = config[.backgroundColor] as? UIColor
        let duration = config[.duration] as? TimeInterval
        let textColor = config[.textColor] as? UIColor
        let image = config[.image] as? UIImage
        let isDragable = config[.isDragable] as? Bool
        let font = config[.font] as? UIFont
        let isToShowLoader = config[.isToShowLoader] as? Bool
        
        
        return RONotificationConfiguration(font: font, duration: duration, textColor: textColor, backgroundColor: backgroundColor, image: image, isDragable: isDragable, title: title, message: message, isToShowLoader: isToShowLoader)
        
    }
}
