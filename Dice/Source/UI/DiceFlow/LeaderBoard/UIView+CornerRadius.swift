//
//  UIView+CornerRadius.swift
//  Dice
//
//  Created by Іван Захарчук on 27.07.2021.
//

import Foundation
import UIKit

extension UIView {
    
    func cornerRadius(radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }

    func borderWidth(borderWidth: CGFloat) {
        self.layer.borderWidth = borderWidth
        self.layer.masksToBounds = true
    }
    
    @IBInspectable
    var cornerRadius: CGFloat {
        set(radius) {
            self.layer.cornerRadius = radius
            self.layer.masksToBounds = true
        }

        get {
            return self.layer.cornerRadius
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        set(borderWidth) {
            self.layer.borderWidth = borderWidth
            self.layer.masksToBounds = true
        }
        
        get {
            return self.layer.borderWidth
        }
    }
}

