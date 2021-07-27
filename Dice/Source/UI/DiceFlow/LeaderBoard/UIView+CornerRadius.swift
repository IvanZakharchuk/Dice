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
        return self.layer.cornerRadius = radius
    }
}
