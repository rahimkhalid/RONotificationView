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
    internal weak var delegate: RONotificationViewDelegate?
    
    internal static func getViewForConfiguration(config: RONotificationConfiguration, delegate: RONotificationViewDelegate) -> UIView {
        
        if let nib = Bundle.main.loadNibNamed(String(describing: self) , owner: self, options: nil)?.first as? UIView,
            let view = nib as? RONotificationStatusBarBannerView {
            
            view.setupUIFor(Configuration: config)
            view.setupGesture()
            view.delegate = delegate
            return view
        }
        
        return UIView()
    }
    
    private func setupUIFor(Configuration config: RONotificationConfiguration){
        bannerTitle.text = config.message
    }
    
    private func setupGesture(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(RONotificationStatusBarBannerView.handleTap))
        self.addGestureRecognizer(tap)
    }
    
    @objc private func handleTap() {
        delegate?.didTappedNotificationBanner?()
    }
    
    internal override func getHeight() -> CGFloat{
        let height = UIApplication.shared.statusBarFrame.height
        return height == 0 ? 20 : height
    }
    
    
}
