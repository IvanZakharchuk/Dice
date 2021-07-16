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
    case needDisplayLeaderBoard
}

class GameView: UIView {
    
    // MARK: -
    // MARK: Properties
    
    public var eventHandler: ((GameViewEvents) -> ())?
        
    public var score = ScoreView()
    
    // MARK: -
    // MARK: IBOutlets
    
    @IBOutlet weak var leaderboardButton: UIButton?
    @IBOutlet weak var botImage: UIImageView?
    @IBOutlet weak var userImage: UIImageView?
    @IBOutlet weak var playGameButton: UIButton?
    
    // MARK: -
    // MARK: IBActions
    
    @IBAction func leaderBoardButton(_ sender: UIButton) {
        self.eventHandler?(.needDisplayLeaderBoard)
    }
    
    @IBAction func playGame(_ sender: UIButton) {
        
    }
    
    // MARK: -
    // MARK: Public
    
    public func setupView() {
        self.backgroundColor = UIColor(patternImage: UIImage(named: "background") ?? UIImage())
        self.setupLeaderboardButton()
        self.setupPlayButton()
    }
    
    public func scoreViewUpdate(user: String) {
        self.score.setupScoreView(user: user)
        self.eventHandler?(.scoreViewUserName(user))
    }
    
    // MARK: -
    // MARK: Private
    
    private func setupLeaderboardButton() {
        self.leaderboardButton?.layer.backgroundColor = UIColor.yellow.cgColor
        self.leaderboardButton?.layer.cornerRadius = 10
        self.leaderboardButton?.layer.borderWidth = 1
        self.leaderboardButton?.layer.borderColor = UIColor.black.cgColor
    }
    
    private func setupPlayButton() {
        self.playGameButton?.layer.backgroundColor = UIColor.systemGreen.cgColor
        self.playGameButton?.layer.cornerRadius = 25
        self.playGameButton?.layer.borderWidth = 1
        self.playGameButton?.layer.borderColor = UIColor.black.cgColor
    }
}
