//
//  BaseView.swift
//  Dice
//
//  Created by Іван Захарчук on 29.07.2021.
//

import Foundation
import UIKit

class BaseView<ViewEvents>: UIView {
    
    public var eventHandler: EventHandler<ViewEvents>? = nil
    
    func setupView() {
        
    }
}
