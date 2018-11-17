//
//  RONotificationType.swift
//  RONotificationView
//
//  Created by rahim on 11/12/18.
//  Copyright © 2018 RO. All rights reserved.
//

import Foundation
import UIKit

internal enum RONotificationType {
    case Progress
    case Message
    case OnStatusBar
    case Custom
    
    func getTopSpacing(for presenterType:RONotificationPresenterType) -> CGFloat{
        
        let orientation = UIDevice.current.orientation
        switch presenterType {
        case .Window:
            return self.getTopSpacingForWindow(with: orientation)
        default:
            return 0
        }
    }
    
    func getTopSpacingForWindow(with orientation:UIDeviceOrientation) -> CGFloat{
        switch orientation {
        case .portrait:
            switch self {
            case .Progress:
                return UIApplication.shared.keyWindow!.safeAreaInsets.top
            default:
                return 0
            }
            
        default:
            return 0
        }
    }
    
    func getExtraHeightForBanner(with presenterType: RONotificationPresenterType) -> CGFloat{
        let orientation = UIDevice.current.orientation
        
        switch presenterType {
        case .Window:
            return getHeightForBannerPresentedOnWindow(with: orientation)
        default:
            return 0
        }
    }
    
    func getHeightForBannerPresentedOnWindow(with orientation:UIDeviceOrientation) -> CGFloat{
        switch orientation {
        case .portrait:
            switch self{
            case .Progress:
                return 0
            default :
                return UIApplication.shared.keyWindow!.safeAreaInsets.top
            }
        default:
            return 0
        }
    }
}

internal enum RONotificationPresenterType {
    case View
    case Controller
    case Window
}
