//
//  UIViewController+Presentation.swift
//  Dice
//
//  Created by Іван Захарчук on 27.07.2021.
//

import Foundation
import UIKit

extension UIViewController {
    
    func presentViewController(_ viewController: UIViewController, animated: Bool = true, completion: (() -> Void)? = nil) {
        self.present(viewController, animated: animated, completion: completion)
    }
    
    func dismissViewController(animated: Bool = true, completion: (() -> Void)? = nil) {
        self.dismiss(animated: animated, completion: completion)
    }
}

