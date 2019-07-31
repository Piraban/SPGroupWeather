//
//  NoNetwork.swift
//  SPGroupWeather
//
//  Created by PBIDEV on 27/7/19.
//  Copyright © 2019 Piraba. All rights reserved.
//

import UIKit

class NoNetwork: UIView {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.setupUI()
    }
    
    func setupUI() -> Void {
        //  let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(NoNetwork.recallNetworkService))
        //  self.addGestureRecognizer(tap)
    }
    
    @objc func recallNetworkService() -> Void {
        //   NotificationCenter.default.post(name: Notification.Name(rawValue: NotificationCenter.invokeNetworkService), object: nil)
    }
}
