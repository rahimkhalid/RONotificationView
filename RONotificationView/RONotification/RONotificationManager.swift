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
    
    internal static func getNotificationBar(for type:RONotificationType, configuration:RONotificationConfiguration, delegate: RONotificationViewDelegate) -> UIView{
        switch type {
        case .Message:
            return RONotificationMessageBannerView.getViewForConfiguration(config: configuration, delegate: delegate)
        case .OnStatusBar:
            return RONotificationStatusBarBannerView.getViewForConfiguration(config: configuration, delegate: delegate)
        case .Progress:
            return RONotificationProgressBarBannerView.getViewForConfiguration(config: configuration, delegate: delegate)
        default:
            return UIView()
        }
    }
}
