//
//  Functions.swift
//  Dice
//
//  Created by Іван Захарчук on 27.07.2021.
//

import Foundation

public typealias EventHandler<Event> = (Event) -> ()

func toString(_ cls: AnyClass) -> String {
    return String(describing: cls)
}
