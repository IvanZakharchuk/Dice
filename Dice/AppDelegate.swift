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
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        
        let coordinator = DiceCoordinator(context: CoreDataManager.shared)
        window.rootViewController = coordinator
        window.makeKeyAndVisible()
        self.window = window
        
        return true
    }
}

