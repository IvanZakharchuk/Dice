//
//  LoginView.swift
//  Dice
//
//  Created by Іван Захарчук on 13.07.2021.
//

import Foundation
import UIKit

enum LoginViewEvents {
    
    case enterButtonPressed(String)
}

class LoginView: UIView, UITextFieldDelegate {
    
    // MARK: -
    // MARK: Properties
    
    public var eventHandler: ((LoginViewEvents) -> ())?
    
    // MARK: -
    // MARK: IBOutlets
    
    @IBOutlet private var userNameTextField: UITextField?
    @IBOutlet private var enterButton: UIButton?
    
    // MARK: -
    // MARK: IBActions
    
    @IBAction func enterButtonPressed(_ sender: UIButton) {
        let userName = userNameTextField?.text
        
        self.eventHandler?(.enterButtonPressed(userName ?? "user"))
    }
    
    // MARK: -
    // MARK: Public
    public func setupView() {
        self.backgroundColor = UIColor(patternImage: UIImage(named: "background-png") ?? UIImage())
        self.setupTextField()
        self.setupEnterButton()
    }
    
    public func setupTextField() {
        self.userNameTextField?.delegate = self
        self.userNameTextField?.borderStyle = .roundedRect
    }
    
    public func setupEnterButton() {
        enterButton?.layer.backgroundColor = UIColor.systemGreen.cgColor
        enterButton?.layer.cornerRadius = 25
        enterButton?.layer.borderWidth = 1
        enterButton?.layer.borderColor = UIColor.black.cgColor
    }
    
    // MARK: -
    // MARK: Private

}
