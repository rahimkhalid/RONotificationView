//
//  RONotificationStatusBarBanner.swift
//  RONotificationView
//
//  Created by rahim on 11/12/18.
//  Copyright © 2018 RO. All rights reserved.
//

import Foundation
import UIKit

class RONotificationStatusBarBannerView: UIView {
    
    @IBOutlet weak var bannerTitle: UILabel!
    
    static func getViewForConfiguration(config: RONotificationConfiguration) -> UIView {
        
        let nib = Bundle.main.loadNibNamed("RONotificationStatusBarBannerView", owner: self, options: nil)
        let view = (nib?.first as? UIView)! as! RONotificationStatusBarBannerView
        view.setupUIFor(Configuration: config)
        
        return view
    }
    
    private func setupUIFor(Configuration config: RONotificationConfiguration){
        bannerTitle.text = config.message
    }
}
