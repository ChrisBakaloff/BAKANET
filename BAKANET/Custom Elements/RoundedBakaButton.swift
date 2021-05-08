//
//  RoundedBakaButton.swift
//  BAKANET
//
//  Created by Hristiyan Bakalov on 08/05/2021.
//

import UIKit

class RoundedBakaButton: UIButton {

    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        backgroundColor = UIColor.white.withAlphaComponent(0.5)
        layer.cornerRadius = 10
        tintColor = UIColor.white
        clipsToBounds = true
        
        
    }
    
    
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        self.backgroundColor = UIColor.white.withAlphaComponent(0.3)
//        self.layer.cornerRadius = self.frame.size.width / 4
//        self.tintColor = UIColor.white
//        self.clipsToBounds = true
//    }

}
