//
//  UIView+Shadow.swift
//  Dice
//
//  Created by Іван Захарчук on 17.02.2023.
//

import Foundation
import UIKit

extension UIView {
    func dropDefaultShadow() {
        self.dropShadow(shadowColor: UIColor.black.withAlphaComponent(0.2).cgColor,
                        shadowOpacity: 1.0,
                        shadowRadius: 4.0,
                        shadowOffset: CGSize(width: 0.0, height: 2.0)
        )
    }
    
    func dropShadow(shadowColor: CGColor,
                           shadowOpacity: Float,
                           shadowRadius: CGFloat,
                           shadowOffset: CGSize) {
        self.layer.shadowColor = shadowColor
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowOffset = shadowOffset
    }
}
