//
//  RONotificationMessageView.swift
//  RONotificationView
//
//  Created by rahim on 11/12/18.
//  Copyright © 2018 RO. All rights reserved.
//

import Foundation
import UIKit

internal class RONotificationMessageBannerView: UIView {
    
    @IBOutlet private weak var dragView: UIView!
    @IBOutlet private weak var image: UIImageView!
    @IBOutlet private weak var title: UILabel!
    @IBOutlet private weak var message: UILabel!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    
    static func getViewForConfiguration(config: RONotificationConfiguration) -> UIView {
        
        let nib = Bundle.main.loadNibNamed("RONotificationMessageBannerView", owner: self, options: nil)
        let view = (nib?.first as? UIView)! as! RONotificationMessageBannerView
        view.setupUIFor(Configuration: config)
        
        return view
    }
    
    private func setupUIFor(Configuration config: RONotificationConfiguration){
        
        message.text = config.message
        title.text = config.title
        activityIndicator.isHidden = !(config.isToShowLoader ?? false)
        if !activityIndicator.isHidden{
            activityIndicator.startAnimating()
        }
        dragView.isHidden = !(config.isDragable  ?? false)
        image.image = config.image
    }
    
    override func getHeight() -> CGFloat{
        return 78
    }
}
