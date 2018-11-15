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
        case .message:
            return RONotificationMessageBannerView.getViewForConfiguration(config: configuration)
        case .onStatusBar:
            return RONotificationStatusBarBannerView.getViewForConfiguration(config: configuration)
        case .progress:
            return RONotificationProgressBarBannerView.getViewForConfiguration(config: configuration)
        default:
            return UIView()
        }
    }
}
