//
//  RONotificationView.swift
//  RONotificationView
//
//  Created by rahim on 11/12/18.
//  Copyright © 2018 RO. All rights reserved.
//

import Foundation
import UIKit

class RONotificationView {
    
    private(set) var configuration: RONotificationConfiguration
    private(set) var type: RONotificationType
    private(set) var bannerView: UIView!
    
    private lazy var window :UIWindow = {
        return UIApplication.shared.keyWindow!
    }()
    
    static func createMessageBanner(config:Dictionary<RONotificationStyle,Any>) -> RONotificationView {
        return RONotificationView.init(RONotificationType.message,config: config)
    }
    
    static func createStatusBarBanner(config:Dictionary<RONotificationStyle,Any>) -> RONotificationView {
        return RONotificationView.init(RONotificationType.onStatusBar, config: config)
    }
    
    //get window
    init(_ type:RONotificationType, config:Dictionary<RONotificationStyle,Any>) {
        self.type = type
        configuration = RONotificationConfigurationManager.setupNotificationBarConfiguration(config: config)
        //showBanner(of: type)
    }
    
    func showBanner() {
        
        bannerView = RONotificationManager.getNotificationBarConfiguration(for: type,configuration: configuration)
        var height:CGFloat = 0
        switch type {
        case .message:
            height = 78
            break
        case .onStatusBar:
            height = 20
            break
        default:
            break
        }
        bannerView.frame = CGRect(x: 0, y: 20, width: UIScreen.main.bounds.width, height: height)
        window.addSubview(bannerView)
        
        UIView.animate(withDuration: 0.3) {
            self.bannerView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: height)
        }
    }
    
    func hideBanner(){
        UIView.animate(withDuration: 0.3) {
            self.bannerView.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        }
        
        bannerView.removeFromSuperview()
        
    }
    
}
