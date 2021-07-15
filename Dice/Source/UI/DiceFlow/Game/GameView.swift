//
//  GameView.swift
//  Dice
//
//  Created by Іван Захарчук on 14.07.2021.
//

import Foundation
import UIKit

enum GameViewEvents {
    
    case scoreViewUserName(String)
}

class GameView: UIView {
    
    // MARK: -
    // MARK: Properties
    
    public var eventHandler: ((GameViewEvents) -> ())?
    
    public var scoreView: ScoreView
    
    // MARK: -
    // MARK: Initializatio
    
    deinit {
        print("deinit")
    }
    
    public init(scoreView: ScoreView) {
        self.scoreView = scoreView
        
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -
    // MARK: IBOutlets
    
    @IBOutlet weak var leaderboardButton: UIButton?
    @IBOutlet weak var botImage: UIImageView?
    @IBOutlet weak var userImage: UIImageView?
    @IBOutlet weak var playGameButton: UIButton?
    
    // MARK: -
    // MARK: IBActions
    
    @IBAction func playGame(_ sender: UIButton) {
        
    }
    
    // MARK: -
    // MARK: Public
    
    public func setupView() {
        self.backgroundColor = UIColor(patternImage: UIImage(named: "background-png") ?? UIImage())
    }
    
    public func scoreViewUpdate(user: String) {
        self.scoreView.setupScoreView(user: user)
        self.eventHandler?(.scoreViewUserName(user))
    }
}

