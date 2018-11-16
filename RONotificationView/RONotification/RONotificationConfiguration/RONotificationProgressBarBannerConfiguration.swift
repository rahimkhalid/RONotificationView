//
//  RONotificationProgressBarBannerConfiguration.swift
//  RONotificationView
//
//  Created by rahim on 11/14/18.
//  Copyright © 2018 RO. All rights reserved.
//

import Foundation
import UIKit

public class RONotificationProgressBarBannerConfiguration: RONotificationConfiguration {
    
    public var isToAnimateView: Bool
    public var backgroundColor: UIColor
    public var isToShowProgressCount: Bool
    public var progressBarColor: UIColor
    public var progressCountFont: UIFont
    public var progressCountColor: UIColor
    public var progressBarStartPosition: Float
    public var progressBarCurrentPosition: Float
    public var progressBarEndPosition: Float
    public var isToAnimateProgressBarGradient: Bool
    
    init(progressBarColor:UIColor,
         progressBarStartPosition:Float,
         progressBarEndPosition:Float,
         isToAnimateView:Bool = true) {
        
        self.backgroundColor = UIColor(white: 1, alpha: 0.5)
        self.isToShowProgressCount = true
        self.progressBarColor = progressBarColor
        self.progressCountFont = UIFont.systemFont(ofSize: 7, weight: .bold)
        self.progressCountColor = UIColor.white
        self.progressBarStartPosition = progressBarStartPosition
        self.progressBarCurrentPosition = progressBarStartPosition
        self.progressBarEndPosition = progressBarEndPosition
        self.isToAnimateProgressBarGradient = false
        self.isToAnimateView = isToAnimateView
    }
    
    internal func setCurrentProgress(progress:Float){
        self.progressBarCurrentPosition = progress
    }
}
