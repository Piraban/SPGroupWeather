//
//  TapToRetryView.swift
//  SPGroupWeather
//
//  Created by PBIDEV on 27/7/19.
//  Copyright © 2019 Piraba. All rights reserved.
//

import UIKit


protocol TapToRetryDelegate {
    func refresh()
}

class TapToRetryView: UIView {
    
    @IBOutlet weak var lblMessage: UILabel!
    
    var delegate : TapToRetryDelegate? = nil
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupUI()
    }
    
    func setupUI() -> Void {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.tapped))
        self.addGestureRecognizer(tap)
    }
    
    @objc func tapped(){
        delegate?.refresh()
    }
    
}


