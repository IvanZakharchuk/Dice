//
//  BaseCoordinator.swift
//  Dice
//
//  Created by Іван Захарчук on 13.07.2021.
//

import Foundation
import UIKit

open class BaseCoordinator: UINavigationController {
    
    // MARK: -
    // MARK: ViewLifeCycle

    open override func viewDidLoad() {
        super.viewDidLoad()
        
        self.prepare()
    }
    
    // MARK: -
    // MARK: Overriding
    
    func prepare() {
        
    }
}
