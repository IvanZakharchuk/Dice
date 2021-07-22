//
//  BaseViewController.swift
//  Dice
//
//  Created by Іван Захарчук on 20.07.2021.
//

import Foundation
import UIKit

protocol RootViewGetable {

    associatedtype RootView
    var rootView: RootView? { get }
}

extension RootViewGetable where Self: BaseViewController, RootView: UIView {
    var rootView: RootView? {
        return self.view as? RootView
    }
}

class BaseViewController: UIViewController {

    // MARK: -
    // MARK: ViewLifeCycle

    open override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureView()
    }
    
    // MARK: -
    // MARK: Overriding
    
    func configureView() {
        
    }
}

