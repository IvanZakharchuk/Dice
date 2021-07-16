//
//  LeadeboardViewController.swift
//  Dice
//
//  Created by Іван Захарчук on 16.07.2021.
//

import UIKit

enum LeaderboardViewControllerEvents {
    
    case back
}

class LeadeboardViewController: UIViewController, RootViewGetable {
    
    typealias RootView = LeaderboardView
    
    // MARK: -
    // MARK: Properties
    public var eventHandler: ((LeaderboardViewControllerEvents) -> ())?
    
    private var user: User
    
    // MARK: -
    // MARK: Initialization
    
    deinit {
        print("deinit")
    }
    
    public init(user: User) {
        self.user = user
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -
    // MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureLeaderboardView()
    }
    
    // MARK: -
    // MARK: Public
    
    // MARK: -
    // MARK: Pvivate
    
    private func configureLeaderboardView() {
        
    }
}
