//
//  RootView.swift
//  Dice
//
//  Created by Іван Захарчук on 13.07.2021.
//

import Foundation

protocol RootViewGetable {

    associatedtype RootView
    var rootView: RootView? { get }
}

extension RootViewGetable where Self: UIViewController, RootView: UIView {
    var rootView: RootView? {
        return self.view as? RootView
    }
}
