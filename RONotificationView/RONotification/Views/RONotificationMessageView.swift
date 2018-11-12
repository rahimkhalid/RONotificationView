//
//  RONotificationMessageView.swift
//  RONotificationView
//
//  Created by rahim on 11/12/18.
//  Copyright © 2018 RO. All rights reserved.
//

import Foundation
import UIKit

class RONotificationMessageView: UIView {
    
    @IBOutlet weak var dragView: UIView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    static func getViewForConfiguration(config: RONotificationConfiguration) -> UIView {
        let nib = Bundle.main.loadNibNamed("RONotificationMessageView", owner: self, options: nil)
        let view = (nib?.first as? UIView)! as! RONotificationMessageView
        view.setupUIFor(Configuration: config)
        
        return view
    }
    
    private func setupUIFor(Configuration config: RONotificationConfiguration){
        message.text = config.message
        title.text = config.title
        activityIndicator.isHidden = !(config.isToShowloader ?? false)
        dragView.isHidden = !(config.isDragable ?? false)
        image.image = config.image
    }
}
