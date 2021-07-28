//
//  LeaderboardView.swift
//  Dice
//
//  Created by Іван Захарчук on 16.07.2021.
//

import Foundation
import UIKit

// делегат и дата сорс в контрллере(есть)

class LeaderboardView: UIView {
    
    // MARK: -
    // MARK: IBOutlets
    
    @IBOutlet private var leaderboardTableView: UITableView?
    
    // MARK: -
    // MARK: Public
    
    public func setupView() {
        self.backgroundColor = UIColor(patternImage: UIImage(named: "background") ?? UIImage())
        self.leaderboardTableView?.register(cell: LeaderboardTableViewCell.self)

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // екстенш на ячейки таблицы глянуть в луа
        let cell = tableView.dequeueReusableCell(withIdentifier: "LeaderboardTableViewCell", for: indexPath) as! LeaderboardTableViewCell
        return cell
    }
}
