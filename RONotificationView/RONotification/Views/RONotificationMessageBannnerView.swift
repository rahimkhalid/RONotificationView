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
    internal weak var delegate: RONotificationViewDelegate?
    
    internal static func getViewForConfiguration(config: RONotificationConfiguration, delegate: RONotificationViewDelegate) -> UIView {
        
        if let nib = Bundle.main.loadNibNamed(String(describing: self) , owner: self, options: nil)?.first as? UIView,
            let view = nib as? RONotificationMessageBannerView {
            
            view.setupUIFor(Configuration: config)
            view.setupGesture()
            view.delegate = delegate
            return view
        }
        
        return UIView()
    }
    
    private func setupUIFor(Configuration config: RONotificationConfiguration){
        
        message.text = config.message
        title.text = config.title
        activityIndicator.isHidden = !(config.isToShowLoader ?? false)
        if !activityIndicator.isHidden{
            activityIndicator.startAnimating()
        }
        dragView.isHidden = true
        //dragView.isHidden = !(config.isDragable  ?? false)
        image.image = config.image
    }
    
    private func setupGesture(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(RONotificationMessageBannerView.handleTap))
        self.addGestureRecognizer(tap)
    }
    
    @objc private func handleTap() {
        delegate?.didTappedNotificationBanner?()
    }
    
    internal override func getHeight() -> CGFloat{
        return 78
    }
}
