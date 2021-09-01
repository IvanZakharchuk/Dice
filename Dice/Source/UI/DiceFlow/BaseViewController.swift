//
//  BaseViewController.swift
//  Dice
//
//  Created by Іван Захарчук on 20.07.2021.
//

import Foundation
import UIKit

class BaseViewController<ViewEvent, ControllerEvents>: UIViewController {
        
    // MARK: -
    // MARK: Variables
    
    public let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    public var eventHandler: ((ControllerEvents) -> ())?
    
    public var rootView: BaseView<ViewEvent>? {
        return self.view as? BaseView
    }
    
    //дженерик тип добавить
    // на луа посмотреть контрлер берет вю дженерик типом и сетит вю
    
//    public var coreData: [Player]?
    
//    public let context = (UIApplication.shared.delegate as? CoreDataService)?.persistentContainer.viewContext

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
    
    func handle(event: ViewEvent) {
        
    }
}
