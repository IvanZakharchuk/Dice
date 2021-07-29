//
//  UITableView+RegisteerCell.swift
//
//  Copyright © 2020 IDAP Group. All rights reserved.
//

import UIKit
import Foundation

extension UITableView {

    func register(cell: AnyClass) {
        let nib = UINib(nibName: toString(cell), bundle: nil)
        self.register(nib, forCellReuseIdentifier: toString(cell))
    }
    
    // по пропертям поискать
    // прописать дженерик как Т что б оно было потом тейблвюселл
    // поковырять
    
//    public func dequeueReusableCell(cellClass: AnyClass, for indexPath: IndexPath) -> UITableViewCell {
//        return self.dequeueReusableCell(withIdentifier: toString(cellClass), for: indexPath)
//    }
    
    @discardableResult
    public func dequeueReusableCell<Result>(cellClass: AnyClass, for indexPath: IndexPath) -> Result
        where Result: UITableViewCell
    {
        let cell = self.dequeueReusableCell(withIdentifier: toString(cellClass), for: indexPath)
        
        guard let value = cell as? Result else {
            fatalError("Dont find identifire")
        }
        
        return value
    }
}

extension UITableViewCell {
    
    static var nib: UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
}
