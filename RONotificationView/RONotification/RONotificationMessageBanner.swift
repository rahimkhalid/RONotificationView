//
//  RONotificationMessageBanner.swift
//  RONotificationView
//
//  Created by rahim on 11/12/18.
//  Copyright © 2018 RO. All rights reserved.
//

import Foundation
import UIKit

public class RONotificationMessageBanner: RONotificationView{

    public init(_ config: RONotificationMessageConfiguration) {
        super.init(config: config)
        self.type = .Message
    }
    
    public init(presentOn view: UIView, config: RONotificationMessageConfiguration) {
        super.init(presentOn: view, config: config)
        self.type = .Message
        self.presenterType = .View
    }
    
    public init(presentOn controller: UIViewController, config: RONotificationMessageConfiguration) {
        super.init(presentOn: controller.view, config: config)
        self.type = .Message
        self.presenterType = .Controller
    }
}
