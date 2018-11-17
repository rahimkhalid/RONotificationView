//
//  RONotificationViewDelegate.swift
//  RONotificationView
//
//  Created by vd-rahim on 11/17/18.
//  Copyright © 2018 RO. All rights reserved.
//

import Foundation

@objc internal protocol RONotificationViewDelegate: class {
    @objc optional func didTappedNotificationBanner()
}
