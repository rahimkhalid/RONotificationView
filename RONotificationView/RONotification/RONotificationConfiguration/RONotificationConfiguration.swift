//
//  RONotificationConfiguration.swift
//  RONotificationView
//
//  Created by rahim on 11/12/18.
//  Copyright © 2018 RO. All rights reserved.
//

import Foundation
import UIKit

@objc protocol RONotificationConfiguration {
    
    @objc optional var messageFont: UIFont {get set}
    @objc optional var titleFont: UIFont {get set}
    @objc optional var duration: TimeInterval { get set }
    @objc optional var messageTextColor: UIColor {get set}
    @objc optional var titleTextColor: UIColor {get set}
    @objc optional var backgroundColor: UIColor {get set}
    @objc optional var image: UIImage {get set}
    @objc optional var isDragable: Bool {get set}
    @objc optional var title: String {get set}
    @objc optional var message: String {get set}
    @objc optional var isToShowLoader: Bool {get set}
}
