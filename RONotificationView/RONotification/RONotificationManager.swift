//
//  RONotificationManager.swift
//  RONotificationView
//
//  Created by rahim on 11/12/18.
//  Copyright © 2018 RO. All rights reserved.
//

import Foundation
import UIKit

internal class RONotificationManager {
    
    internal static func getNotificationBarConfiguration(for type:RONotificationType, configuration:RONotificationConfiguration) -> UIView{
        switch type {
        case .Message:
            return RONotificationMessageBannerView.getViewForConfiguration(config: configuration)
        case .OnStatusBar:
            return RONotificationStatusBarBannerView.getViewForConfiguration(config: configuration)
        case .Progress:
            return RONotificationProgressBarBannerView.getViewForConfiguration(config: configuration)
        default:
            return UIView()
        }
    }
}
