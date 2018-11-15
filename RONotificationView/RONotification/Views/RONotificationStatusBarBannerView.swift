//
//  RONotificationStatusBarBanner.swift
//  RONotificationView
//
//  Created by rahim on 11/12/18.
//  Copyright © 2018 RO. All rights reserved.
//

import Foundation
import UIKit

internal class RONotificationStatusBarBannerView: UIView {
    
    @IBOutlet private weak var bannerTitle: UILabel!

    internal static func getViewForConfiguration(config: RONotificationConfiguration) -> UIView {
        
        if let nib = Bundle.main.loadNibNamed(String(describing: self) , owner: self, options: nil)?.first as? UIView,
            let view = nib as? RONotificationStatusBarBannerView {
            
            view.setupUIFor(Configuration: config)
            return view
        }
        
        return UIView()
    }
    
    private func setupUIFor(Configuration config: RONotificationConfiguration){
        bannerTitle.text = config.message
    }
    
    internal override func getHeight() -> CGFloat{
        let height = UIApplication.shared.statusBarFrame.height
        return height == 0 ? 20 : height
    }
}
