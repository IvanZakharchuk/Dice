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

class GameView: BaseView {
    
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
    
    public func configureScoreView(user: String) {
        self.scoreView?.configureScoreView(user: user)
    }
    
    public func scoreViewUpdate(botScore: String, userScore: String) {
        self.scoreView?.setupScoreView(botScore: botScore, userScore: userScore )
    }
    
    public func setupGameameImages(botImage: String, userImage: String) {
        self.botImage?.image = UIImage(named: botImage)
        self.userImage?.image = UIImage(named: userImage)
    }
    
    // MARK: -
    // MARK: Ovverided
    
    override func setupView() {
        super.setupView()
        
        self.backgroundColor = UIColor(patternImage: UIImage(named: "background") ?? UIImage())
        self.setupLeaderboardButton()
        self.setupPlayButton()
    }
    
    // MARK: -
    // MARK: Private
    
    private func setupLeaderboardButton() {
        self.leaderboardButton?.cornerRadius(radius: 10)
        self.leaderboardButton?.borderWidth(borderWidth: 2)
    }
    
    private func setupPlayButton() {
        self.playGameButton?.cornerRadius(radius: 25)
        self.playGameButton?.borderWidth(borderWidth: 2)
    }
}
