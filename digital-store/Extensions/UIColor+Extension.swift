//
//  UIColor+Extension.swift
//  digital-store
//
//  Created by ADELU ABIDEEN ADELEYE on 10/11/18.
//  Copyright © 2018 Spantom Technologies Ltd. All rights reserved.
//

import UIKit

extension UIColor {
    public convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
    
    static var buyButtonBorderColor: UIColor = {
        return UIColor(r: 0, g: 129, b: 250)
    }()
    
}
