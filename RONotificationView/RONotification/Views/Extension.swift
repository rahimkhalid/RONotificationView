//
//  UIViewExtension.swift
//  RONotificationView
//
//  Created by rahim on 11/13/18.
//  Copyright © 2018 RO. All rights reserved.
//

import Foundation
import UIKit

internal extension UIView{
    
    @objc internal func getHeight() -> CGFloat{
        return self.frame.height
    }
}

internal extension UIColor {
    
    var lighterColor: UIColor {
        return lighterColor(removeSaturation: 0.2, resultAlpha: -1)
    }
    
    internal func lighterColor(removeSaturation val: CGFloat, resultAlpha alpha: CGFloat) -> UIColor {
        var h: CGFloat = 0, s: CGFloat = 0
        var b: CGFloat = 0, a: CGFloat = 0
        
        guard getHue(&h, saturation: &s, brightness: &b, alpha: &a)
            else {return self}
        
        return UIColor(hue: h,
                       saturation: max(s - val, 0.0),
                       brightness: b,
                       alpha: alpha == -1 ? a : alpha)
    }
}
