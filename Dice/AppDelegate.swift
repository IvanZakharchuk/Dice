//
//  AppDelegate.swift
//  Dice
//
//  Created by Іван Захарчук on 12.07.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // MARK: -
    // MARK: Properties
    
    var window: UIWindow?
    
    
//    private var diceCoordinator: DiceCoordinator?
    
//    let manager = CoreDataManager()
//    public let context: Fetchable & Storable
//
//    init(context: Fetchable & Storable) {
//        self.context = context
//    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        
        
//        let context = self.diceCoordinator?.context
//        self.diceCoordinator = DiceCoordinator(context: context!)
//        let context: Fetchable & Storable
        
//        let context = self.diceCoordinator?.context
//        self.diceCoordinator = DiceCoordinator(context: context)
//        let context = CoreDataManager.shared.viewContext
        
        let coordinator = DiceCoordinator(context: CoreDataManager.init())
        
//        let coordinator = DiceCoordinator.self
        window.rootViewController = coordinator
        window.makeKeyAndVisible()
        self.window = window
        
        return true
    }
}

