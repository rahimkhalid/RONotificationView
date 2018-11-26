//
//  RONotificationViewDemo.swift
//  RONotificationView
//
//  Created by vd-rahim on 11/23/18.
//  Copyright © 2018 RO. All rights reserved.
//

import Foundation
import UIKit

class RONotificationViewDemo : UIViewController{
    
    let roNotificationTypes = ["Title Banner", "Detailed Banner", "Custom Banner", "ProgressBanner"]
}

extension RONotificationViewDemo : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return roNotificationTypes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "demoCell")
        cell?.textLabel?.text = roNotificationTypes[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            performSegue(withIdentifier: "statusBarDemoSegue", sender: nil)
        case 1:
            performSegue(withIdentifier: "MessageBannerDemoSegue", sender: nil)
        case 2:
            performSegue(withIdentifier: "customBannerDemoSegue", sender: nil)
        case 3:
            performSegue(withIdentifier: "progressBarDemoSegue", sender: nil)
        default:
            return
        }
    }
}
