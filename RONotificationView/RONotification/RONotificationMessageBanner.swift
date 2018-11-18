//
//  RONotificationMessageBanner.swift
//  RONotificationView
//
//  Created by rahim on 11/12/18.
//  Copyright © 2018 RO. All rights reserved.
//

import Foundation
import UIKit

/// RONV: 'RONotificationMessageBanner' This is a child class for 'RONotificationView' basically used for setting up Message banner.
public class RONotificationMessageBanner: RONotificationView{

    /// RONV: This init is called when presenter is used to be set as window.
    /// RONV: It sets type on parent class as message and
    /// RONV: No need to set PresenterType as default is window.
    public init(_ config: RONotificationMessageConfiguration) {
        super.init(config: config)
        self.type = .message
    }
    
    /// RONV: This init is called when presenter is used to be set as UIView.
    /// RONV: It sets type on parent class as message and
    /// RONV: need to set PresenterType as view.
    public init(presentOn view: UIView, config: RONotificationMessageConfiguration) {
        super.init(presentOn: view, config: config)
        self.type = .message
        self.presenterType = .view
    }
    
    /// RONV: This init is called when presenter is used to be set as Controller.
    /// RONV: It sets type on parent class as message and
    /// RONV: need to set PresenterType as Controller.
    public init(presentOn controller: UIViewController, config: RONotificationMessageConfiguration) {
        super.init(presentOn: controller.view, config: config)
        self.type = .message
        self.presenterType = .controller
    }
}
