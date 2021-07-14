//
//  LoginView.swift
//  Dice
//
//  Created by Іван Захарчук on 13.07.2021.
//

import Foundation
import UIKit

enum LoginViewEvents {
    
    case enterButtonPressed(User)
}

class LoginView: UIView, UITextFieldDelegate {
    
    // MARK: -
    // MARK: Properties
    
    public var eventHandler: ((LoginViewEvents) -> ())?
    
    public var user: User
    
    // MARK: -
    // MARK: Initialization
    
    public init(user: User) {
        self.user = user
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -
    // MARK: IBOutlets
    
    @IBOutlet private var userNameTextField: UITextField?
    @IBOutlet private var enterButton: UIButton?
    
    // MARK: -
    // MARK: IBActions
    
    @IBAction func enterButtonPressed(_ sender: UIButton) {
        self.eventHandler?(.enterButtonPressed(user))
    }
    
    // MARK: -
    // MARK: Public
    
    public func setupTextField() {
        self.userNameTextField?.delegate = self
        self.userNameTextField?.borderStyle = .none
        self.userNameTextField?.text = user.userName
        
    }
}
