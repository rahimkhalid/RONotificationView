//
//  RONotificationProgressBarBannerView.swift
//  RONotificationView
//
//  Created by vd-rahim on 11/14/18.
//  Copyright © 2018 RO. All rights reserved.
//

import UIKit

internal class RONotificationProgressBarBannerView: UIView {

    @IBOutlet private weak var progressViewWidth: NSLayoutConstraint!
    @IBOutlet private weak var progressView: UIView!
    @IBOutlet private weak var progressCountLabel: UILabel!
    
    override func getHeight() -> CGFloat {
        return progressCountLabel.isHidden ? 7 : 15
    }
    
    static func getViewForConfiguration(config: RONotificationConfiguration) -> UIView {
        
        let nib = Bundle.main.loadNibNamed("RONotificationProgressBarBannerView", owner: self, options: nil)
        let view = (nib?.first as? UIView)! as! RONotificationProgressBarBannerView
        view.setupUIFor(Configuration: config)
        
        return view
    }
    
    private func setupUIFor(Configuration config: RONotificationConfiguration){
        
        progressViewWidth.constant = CGFloat(config.progressBarCurrentPosition ?? 0)
        if config.isToAnimateProgressBarGradient!{
            setupGradient(for: config.progressBarColor!)
        }else{
            progressView.backgroundColor = config.progressBarColor
        }
        
        progressCountLabel.isHidden = !(config.isToShowProgressCount ?? true)
        if !progressCountLabel.isHidden{
            progressCountLabel.text = "\(config.progressBarCurrentPosition ?? 0)%"
        }
        progressCountLabel.textColor = config.progressCountColor
        
    }
    
    private func setupGradient(for color:UIColor){
        
        progressView.backgroundColor = color
        let gradient = createGradient(with: color.lighterColor)
        let animation = createAnimation()
        // add the animation to the gradient
        gradient.add(animation, forKey: "gradientAnimation")
        gradient.frame = progressView.bounds
        progressView.layer.insertSublayer(gradient, at: 0)
    }
    
    private func createAnimation() -> CABasicAnimation{
        
        // set up the animation
        let animation = CABasicAnimation(keyPath: "locations")
        animation.fromValue = [NSNumber(value: -1.0), NSNumber(value: 0.0), NSNumber(value: 0.0), NSNumber(value: 1.0)]
        animation.toValue = [NSNumber(value: 0.0), NSNumber(value: 1.0), NSNumber(value: 1.0),NSNumber(value: 2.0)]
        animation.duration = 1.5
        animation.autoreverses = false
        animation.isRemovedOnCompletion = false
        animation.fillMode = kCAFillModeRemoved
        animation.repeatCount = Float.infinity
        
        return animation
    }
    
    private func createGradient(with color:UIColor) -> CAGradientLayer {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.clear.cgColor, color.cgColor, color.cgColor, UIColor.clear.cgColor]
        gradient.locations = [NSNumber(value: 0.0), NSNumber(value: 0.3), NSNumber(value: 0.7), NSNumber(value: 1.0)]
        gradient.startPoint = CGPoint.init(x: 0, y: 0)
        gradient.endPoint = CGPoint.init(x: 1, y: 0)
        
        return gradient
    }
    
    func animateProgressBarTo(position: Float, final:Float){
        self.progressViewWidth.constant = CGFloat(position/final) * self.frame.width
        progressCountLabel.text = "\(position)%"
        UIView.animate(withDuration: 0.3) {[weak self] in
            self?.progressView.superview?.layoutIfNeeded()
            self?.progressView.layer.sublayers?.first?.frame = (self?.progressView.frame)!
            
        }
        
    }
}
