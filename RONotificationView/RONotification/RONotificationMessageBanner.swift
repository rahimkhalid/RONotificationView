//
//  RONotificationMessageBanner.swift
//  RONotificationView
//
//  Created by rahim on 11/12/18.
//  Copyright © 2018 RO. All rights reserved.
//

import Foundation
import UIKit

class RONotificationMessageBanner: RONotificationView{

    init(_ config: RONotificationMessageConfiguration) {
        super.init(config: config)
        self.type = RONotificationType.message
    }
}
