//
//  RONotificationView.swift
//  RONotificationView
//
//  Created by rahim on 11/12/18.
//  Copyright © 2018 RO. All rights reserved.
//

import Foundation
import UIKit

//weak var window :UIWindow? = {
//    return UIApplication.shared.keyWindow!
//}()


protocol RONotificationView {
    var configuration: RONotificationConfiguration {get set}
    var bannerView: UIView? {get set}
    func showBanner()
    func hideBanner()
}
