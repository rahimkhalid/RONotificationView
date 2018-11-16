//
//  RONotificationCustomViewConfiguration.swift
//  RONotificationView
//
//  Created by rahim on 11/13/18.
//  Copyright © 2018 RO. All rights reserved.
//

import Foundation

public class RONotificationCustomViewConfiguration: RONotificationConfiguration {
    
    public var isToAnimateView: Bool
    public var duration: TimeInterval
    
    init(duration:TimeInterval = 0, isToAnimateView: Bool = true) {
        self.duration = duration
        self.isToAnimateView = isToAnimateView
    }
}
