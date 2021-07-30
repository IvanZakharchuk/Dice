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
    // MARK: Variables
    
    public var rootView: BaseView? {
        return self.view as? BaseView
    }

    // MARK: -
    // MARK: Initialization
    
    deinit {
        debugPrint("deinit: \(type(of: self))")
    }

    // MARK: -
    // MARK: ViewLifeCycle

    open override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureView()
        // вынести сюда функци(часть есть)
    }
    
    // MARK: -
    // MARK: Overriding
    
    func configureView() {
        self.rootView?.setupView()
    }
    
    func handle() {
        
    }
}

protocol Events {
    associatedtype Events
    
    var event: Events? { get }
}

extension Events {
    
    var event: Events? {
        return self.event
    }
}
