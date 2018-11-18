//
//  RONotificationType.swift
//  RONotificationView
//
//  Created by rahim on 11/12/18.
//  Copyright © 2018 RO. All rights reserved.
//

import Foundation
import UIKit

/// RONV: RONotificationType is a Enum used to set and help identify user selected type and based on that perform operation.
internal enum RONotificationType {
    case progress
    case message
    case onStatusBar
    case custom
    
    /// RONV: help for getting spacing on devices with notch based on logic according to presenter type.
    func getTopSpacing(for presenterType:RONotificationPresenterType) -> CGFloat{
        
        let orientation = UIDevice.current.orientation
        switch presenterType {
        case .window:
            return self.getTopSpacingForWindow(with: orientation)
        default:
            return 0
        }
    }
    
    /// RONV: get top spacing for presenter as Window for progressBar
    func getTopSpacingForWindow(with orientation:UIDeviceOrientation) -> CGFloat{
        switch orientation {
        case .portrait:
            switch self {
            case .progress:
                return UIApplication.shared.keyWindow!.safeAreaInsets.top
            default:
                return 0
            }
            
        default:
            return 0
        }
    }
    
    /// RONV: Get extra height for devices with notch.
    func getExtraHeightForBanner(with presenterType: RONotificationPresenterType) -> CGFloat{
        let orientation = UIDevice.current.orientation
        
        switch presenterType {
        case .window:
            return getHeightForBannerPresentedOnWindow(with: orientation)
        default:
            return 0
        }
    }
    
    /// RONV: Get extra height for devices with notch when presenter is Window.
    func getHeightForBannerPresentedOnWindow(with orientation:UIDeviceOrientation) -> CGFloat{
        switch orientation {
        case .portrait:
            switch self{
            case .progress:
                return 0
            default :
                return UIApplication.shared.keyWindow!.safeAreaInsets.top
            }
        default:
            return 0
        }
    }
}

/// RONV: Help identify presenter Type.
internal enum RONotificationPresenterType {
    case view
    case controller
    case window
}
