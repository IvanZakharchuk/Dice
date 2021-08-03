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

extension RootViewGetable where Self: UIViewController, RootView: UIView {
    var rootView: RootView? {
        return self.view as? RootView
    }
}

//protocol Events {
//    associatedtype Events

//    var event: Events? { get }
//}

//extension Events {
//
//    var event: Events? {
//        return self.event
//    }
//}

class BaseViewController<ViewEvent>: UIViewController {
        
    // MARK: -
    // MARK: Variables
    
    public let events: EventHandler<ViewEvent>? = nil
    
    public var rootView: BaseView? {
        return self.view as? BaseView
    }

    // MARK: -
    // MARK: Initialization
    
    deinit {
        debugPrint("deinit: \(type(of: self))")
    }
    
//    init(events: @escaping EventHandler<Event>) {
//        super.init()
//        self.events = events
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
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
    
    func handle(event: ViewEvent) {

    }
}
