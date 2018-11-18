//
//  RONotificationManager.swift
//  RONotificationView
//
//  Created by rahim on 11/12/18.
//  Copyright © 2018 RO. All rights reserved.
//

import Foundation
import UIKit

/// RONV: RONotificationManager is used get view based on type.
internal class RONotificationManager {
    
    internal static func getNotificationBar(for type:RONotificationType, configuration:RONotificationConfiguration, delegate: RONotificationViewDelegate) -> UIView{
        switch type {
        case .message:
            return RONotificationMessageBannerView.getViewForConfiguration(config: configuration, delegate: delegate)
        case .onStatusBar:
            return RONotificationStatusBarBannerView.getViewForConfiguration(config: configuration, delegate: delegate)
        case .progress:
            return RONotificationProgressBarBannerView.getViewForConfiguration(config: configuration, delegate: delegate)
        default:
            return UIView()
        }
    }
}
