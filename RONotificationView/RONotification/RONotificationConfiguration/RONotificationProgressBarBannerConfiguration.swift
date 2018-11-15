//
//  RONotificationProgressBarBannerConfiguration.swift
//  RONotificationView
//
//  Created by vd-rahim on 11/14/18.
//  Copyright © 2018 RO. All rights reserved.
//

import Foundation
import UIKit

open class RONotificationProgressBarBannerConfiguration: RONotificationConfiguration {
    
    var backgroundColor: UIColor
    var isToShowProgressCount: Bool
    var progressBarColor: UIColor
    var progressCountFont: UIFont
    var progressCountColor: UIColor
    var progressBarStartPosition: Float
    var progressBarCurrentPosition: Float
    var progressBarEndPosition: Float
    var isToAnimateProgressBarGradient: Bool
    
    init(progressBarColor:UIColor,
         progressBarStartPosition:Float,
         progressBarEndPosition:Float) {
        
        self.backgroundColor = UIColor(white: 1, alpha: 0.5)
        self.isToShowProgressCount = true
        self.progressBarColor = progressBarColor
        self.progressCountFont = UIFont.systemFont(ofSize: 7, weight: .bold)
        self.progressCountColor = UIColor.white
        self.progressBarStartPosition = progressBarStartPosition
        self.progressBarCurrentPosition = progressBarStartPosition
        self.progressBarEndPosition = progressBarEndPosition
        self.isToAnimateProgressBarGradient = false
    }
    
    func setCurrentProgress(progress:Float){
        self.progressBarCurrentPosition = progress
    }
}
