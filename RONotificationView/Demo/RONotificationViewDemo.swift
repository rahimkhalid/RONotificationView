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
}
