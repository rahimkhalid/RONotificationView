//
//  RONotificationConfiguration.swift
//  RONotificationView
//
//  Created by rahim on 11/12/18.
//  Copyright © 2018 RO. All rights reserved.
//

import Foundation
import UIKit

public class RONotificationConfiguration {
    
    public var font: UIFont?
    public var duration: TimeInterval?
    public var textColor: UIColor?
    public var backgroundColor: UIColor?
    public var image: UIImage?
    public var isDragable: Bool?
    public var title: String?
    public var message: String?
    public var isToShowloader: Bool?
    
    init() {
        
    }
    
    init(font: UIFont?,
         duration: TimeInterval?,
         textColor: UIColor?,
         backgroundColor: UIColor?,
         image: UIImage?,
         isDragable: Bool?,
         title: String?,
         message: String?,
         isToShowLoader: Bool?) {
        
        self.font = font
        self.duration = duration
        self.textColor = textColor
        self.backgroundColor = backgroundColor
        self.image = image
        self.isDragable = isDragable
        self.title = title
        self.message = message
        self.isToShowloader = isToShowLoader
    }
}
