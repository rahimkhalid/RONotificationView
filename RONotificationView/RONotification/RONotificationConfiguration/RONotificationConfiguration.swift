//
//  RONotificationConfiguration.swift
//  RONotificationView
//
//  Created by rahim on 11/12/18.
//  Copyright © 2018 RO. All rights reserved.
//

import Foundation
import UIKit

/// RONV: RONotificationConfiguration is protocol help in setting configuration for different types of banner.
@objc public protocol RONotificationConfiguration {
    
    @objc var isToAnimateView: Bool {get set}
    @objc optional var messageFont: UIFont {get set}
    @objc optional var titleFont: UIFont {get set}
    @objc optional var duration: TimeInterval { get set }
    @objc optional var messageTextColor: UIColor {get set}
    @objc optional var titleTextColor: UIColor {get set}
    @objc optional var backgroundColor: UIColor {get set}
    @objc optional var image: UIImage {get set}
    //@objc optional var isDragable: Bool {get set}
    @objc optional var title: String {get set}
    @objc optional var message: String {get set}
    @objc optional var isToShowLoader: Bool {get set}
    @objc optional var isToAnimateProgressBarGradient: Bool {get set}
    @objc optional var progressBarColor: UIColor {get set}
    @objc optional var isToShowProgressCount: Bool {get set}
    @objc optional var progressCountFont: UIFont {get set}
    @objc optional var progressCountColor: UIColor {get set}
    @objc optional var progressBarStartPosition: Float {get set}
    @objc optional var progressBarEndPosition: Float {get set}
    @objc optional var progressBarCurrentPosition: Float {get set}
}
