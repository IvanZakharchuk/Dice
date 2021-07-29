//
//  LoginView.swift
//  Dice
//
//  Created by Іван Захарчук on 13.07.2021.
//

import Foundation
import UIKit

enum LoginViewEvents {
    
    case shareUserName(String)
}

class LoginView: BaseView, UITextFieldDelegate {
    
    // MARK: -
    // MARK: Properties
    
    public var eventHandler: ((LoginViewEvents) -> ())?
    
    // MARK: -
    // MARK: IBOutlets
    
    @IBOutlet private var welcomeLabel: UILabel?
    @IBOutlet private var userNameTextField: UITextField?
    @IBOutlet private var enterButton: UIButton?
    
    // MARK: -
    // MARK: IBActions
    
    @IBAction func enterButtonPressed(_ sender: UIButton) {
        let userName = userNameTextField?.text
        
        self.eventHandler?(.shareUserName(userName ?? "user"))
    }

    // MARK: -
    // MARK: Overrided
    
    override func setupView() {
        super.setupView()
        
        self.backgroundColor = UIColor(patternImage: UIImage(named: "background-png") ?? UIImage())
        self.userNameTextField?.becomeFirstResponder()
        
        // екстеншини на ксиб что б сделать ето там(есть)
        self.enterButton?.borderWidth(borderWidth: 1)
        self.enterButton?.cornerRadius(radius: 25)
        
        self.animatedElements()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.userNameTextField?.resignFirstResponder()
    }
    
    // MARK: -
    // MARK: Private 
    
    private func animatedElements() {
        self.welcomeLabel?.center.x += self.bounds.width // right
        self.userNameTextField?.center.x -= self.bounds.width // left 
        self.enterButton?.center.x -= self.bounds.width
        
        UIView.animate(withDuration: 0.5) {
            self.welcomeLabel?.center.x -= self.bounds.width
        }
        
        UIView.animate(withDuration: 0.7, delay: 0.4, options: [], animations: {
                        self.userNameTextField?.center.x += self.bounds.width },
                       completion: nil)
        
        UIView.animate(withDuration: 0.7, delay: 0.5, options: [], animations: {
                        self.enterButton?.center.x += self.bounds.width },
                       completion: nil)
    }
}
