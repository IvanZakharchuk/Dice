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

<<<<<<< HEAD
protocol Events {
    associatedtype Events
    
<<<<<<< HEAD
    var event: Events? { get }
}

extension Events {
    
    var event: Events? {
        return self.event
    }
}

class BaseViewController: UIViewController {
=======
=======
//protocol Events {
//    associatedtype Events

>>>>>>> feature/30.07
//    var event: Events? { get }
//}

<<<<<<< HEAD
extension Events {
>>>>>>> feature/30.07
    
    var event: Events? {
        return self.event
    }
}
=======
//extension Events {
//
//    var event: Events? {
//        return self.event
//    }
//}
>>>>>>> feature/30.07

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
    
<<<<<<< HEAD
    func handle() {
        
    }
}


=======
    func handle(event: ViewEvent) {

    }
}
>>>>>>> feature/30.07
