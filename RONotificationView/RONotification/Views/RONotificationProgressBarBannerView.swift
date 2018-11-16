//
//  RONotificationProgressBarBannerView.swift
//  RONotificationView
//
//  Created by rahim on 11/14/18.
//  Copyright © 2018 RO. All rights reserved.
//

import UIKit

internal class RONotificationProgressBarBannerView: UIView {

    @IBOutlet private weak var progressViewWidth: NSLayoutConstraint!
    @IBOutlet private weak var progressView: UIView!
    @IBOutlet private weak var progressCountLabel: UILabel!
    
    internal override func getHeight() -> CGFloat {
        return progressCountLabel.isHidden ? 7 : 15
    }
    
    internal static func getViewForConfiguration(config: RONotificationConfiguration) -> UIView {
        
        if let nib = Bundle.main.loadNibNamed(String(describing: self) , owner: self, options: nil)?.first as? UIView,
            let view = nib as? RONotificationProgressBarBannerView {
            
            view.setupUIFor(Configuration: config)
            return view
        }
        
        return UIView()
    }
    
    private func setupUIFor(Configuration config: RONotificationConfiguration){
        
        progressViewWidth.constant = CGFloat(config.progressBarCurrentPosition ?? 0)
        
        if let animateProgressBarGradient = config.isToAnimateProgressBarGradient,
            let color = config.progressBarColor{
            progressView.backgroundColor = config.progressBarColor
            if animateProgressBarGradient{
                setupGradient(for: color)
            }
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
        gradient.frame = progressView.frame
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
    
    internal func animateProgressBarTo(position: Float, final:Float){
        self.progressViewWidth.constant = CGFloat(position/final) * self.frame.width
        progressCountLabel.text = "\(position)%"
        UIView.animate(withDuration: 0.3) {[weak self] in
            guard let weakSelf = self else {
                return
            }
            weakSelf.progressView.superview?.layoutIfNeeded()
            weakSelf.progressView.layer.sublayers?.first?.frame = weakSelf.progressView.frame
            
        }
        
    }
}
