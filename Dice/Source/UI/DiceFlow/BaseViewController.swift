//
//  BaseViewController.swift
//  Dice
//
//  Created by Іван Захарчук on 20.07.2021.
//

import Foundation
import UIKit

class BaseViewController<View, ViewEvents, ControllerEvents>: UIViewController where View: BaseView<ViewEvents> {
        
    // MARK: -
    // MARK: Variables
        
    public var eventHandler: ((ControllerEvents) -> ())?
    
    public var rootView: View? {
        return self.view as? View
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
    }
    
    // MARK: -
    // MARK: Overriding
    
    func configureView() {
        self.rootView?.setupView()
        self.rootView?.eventHandler = { [weak self] event in
            self?.handle(event: event)
        }
    }
    
    func handle(event: ViewEvents) {
        
    }
}
