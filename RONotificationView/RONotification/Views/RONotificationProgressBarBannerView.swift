//
//  RONotificationProgressBarBannerView.swift
//  RONotificationView
//
//  Created by vd-rahim on 11/14/18.
//  Copyright © 2018 RO. All rights reserved.
//

import UIKit

class RONotificationProgressBarBannerView: UIView {

    @IBOutlet weak var progressViewWidth: NSLayoutConstraint!
    @IBOutlet weak var progressView: UIView!
    @IBOutlet weak var progressCountLabel: UILabel!
    
    override func getHeight() -> CGFloat {
        return 15
    }
    
    static func getViewForConfiguration(config: RONotificationConfiguration) -> UIView {
        
        let nib = Bundle.main.loadNibNamed("RONotificationProgressBarBannerView", owner: self, options: nil)
        let view = (nib?.first as? UIView)! as! RONotificationProgressBarBannerView
        view.setupUIFor(Configuration: config)
        
        return view
    }
    
    private func setupUIFor(Configuration config: RONotificationConfiguration){
        
        progressViewWidth.constant = CGFloat(config.progressBarCurrentPosition ?? 0)
        progressView.backgroundColor = config.progressBarColor
        progressCountLabel.isHidden = !(config.isToShowProgressCount ?? true)
        if !progressCountLabel.isHidden{
            progressCountLabel.text = "\(config.progressBarCurrentPosition ?? 0)%"
        }
        progressCountLabel.textColor = config.progressCountColor
        //progressView.layer.insertSublayer(config.progressBarGradient!, at: 0)
    }
    
    func animateProgressBarTo(position: Float, final:Float){
        self.progressViewWidth.constant = CGFloat(position/final) * self.frame.width
        progressCountLabel.text = "\(position)%"
        UIView.animate(withDuration: 0.3) {[weak self] in
            self?.progressView.superview?.layoutIfNeeded()
        }
    }
}
