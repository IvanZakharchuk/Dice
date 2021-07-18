//
//  GameView.swift
//  Dice
//
//  Created by Іван Захарчук on 14.07.2021.
//

import Foundation
import UIKit

enum GameViewEvents {
    
    case needDisplayLeaderBoard
    case updateDices
}

class GameView: UIView {
    
    // MARK: -
    // MARK: Properties
    
    public var eventHandler: ((GameViewEvents) -> ())?
    
    
    // MARK: -
    // MARK: IBOutlets
    
    @IBOutlet private var leaderboardButton: UIButton?
    @IBOutlet private var botImage: UIImageView?
    @IBOutlet private var userImage: UIImageView?
    @IBOutlet private var playGameButton: UIButton?
    
    @IBOutlet private var scoreView: ScoreView?
    
    // MARK: -
    // MARK: IBActions
    
    @IBAction func leaderBoardButton(_ sender: UIButton) {
        self.eventHandler?(.needDisplayLeaderBoard)
    }
    
    @IBAction func playGame(_ sender: UIButton) {
        self.eventHandler?(.updateDices)
    }
    
    // MARK: -
    // MARK: Public
    
    public func setupView() {
        self.backgroundColor = UIColor(patternImage: UIImage(named: "background") ?? UIImage())
        self.setupLeaderboardButton()
        self.setupPlayButton()
    }
    
    public func scoreViewUpdate(user: String) {
        self.setupScoreView(user: user)
    }
    
    public func gameLogic(botImage: String, userImage: String) {
        self.gameImages(botImage: botImage, userImage: userImage)
    }
    
    // MARK: -
    // MARK: Private
    
    private func setupScoreView(user: String) {
        self.scoreView?.setupScoreView(user: user)
    }
    
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
    
    // MARK: -
    // MARK: Game
    
    private func gameImages(botImage: String, userImage: String) {
        self.botImage?.image = UIImage(named: botImage)
        self.userImage?.image = UIImage(named: userImage)
    }
}
