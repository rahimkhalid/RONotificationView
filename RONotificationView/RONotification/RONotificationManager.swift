//
//  RONotificationManager.swift
//  RONotificationView
//
//  Created by rahim on 11/12/18.
//  Copyright © 2018 RO. All rights reserved.
//

import Foundation
import UIKit

class RONotificationManager {
    
    static func getNotificationBarConfiguration(for type:RONotificationType, configuration:RONotificationConfiguration) -> UIView{
        switch type {
        case .message:
            return RONotificationMessageView.getViewForConfiguration(config: configuration)
        case .onStatusBar:
            return RONotificationStatusBarBanner.getViewForConfiguration(config: configuration)
        default:
            return UIView()
        }
    }
}
