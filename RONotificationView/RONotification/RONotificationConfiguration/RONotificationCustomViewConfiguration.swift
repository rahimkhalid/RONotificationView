//
//  RONotificationCustomViewConfiguration.swift
//  RONotificationView
//
//  Created by rahim on 11/13/18.
//  Copyright © 2018 RO. All rights reserved.
//

import Foundation

open class RONotificationCustomViewConfiguration: RONotificationConfiguration {
    
    var duration: TimeInterval
    
    init(duration:TimeInterval = 0) {
        self.duration = duration
    }
}
