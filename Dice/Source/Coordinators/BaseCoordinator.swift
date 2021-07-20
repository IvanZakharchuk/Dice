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
        self.setupNavigation()
    }
    
    // MARK: -
    // MARK: Private
    
    private func setupNavigation() {
        navigationItem.hidesBackButton = true
        navigationItem.backBarButtonItem?.tintColor = .white
        navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationBar.shadowImage = UIImage()
    }
    
    // MARK: -
    // MARK: Overriding
    
    func prepare() {
        
    }
}
