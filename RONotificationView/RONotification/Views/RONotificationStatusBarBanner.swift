//
//  RONotificationStatusBarBanner.swift
//  RONotificationView
//
//  Created by rahim on 11/12/18.
//  Copyright © 2018 RO. All rights reserved.
//

import Foundation
import UIKit

class RONotificationStatusBarBanner: UIView {
    
    @IBOutlet weak var bannerTitle: UILabel!
    static func getViewForConfiguration(config:RONotificationConfiguration) -> UIView {
        let nib = Bundle.main.loadNibNamed("RONotificationStatusBarBanner", owner: self, options: nil)
        let view = (nib?.first as? UIView)! as! RONotificationStatusBarBanner
        //view = iNotifUtils.getViewWithReference("iNotifMessageView") as! iNotifMessageView
        view.setupUIFor(Configuration: config)
        
        return view
    }
    
    private func setupUIFor(Configuration config:RONotificationConfiguration){
        bannerTitle.text = config.title
    }
}
