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

class GameView: BaseView<GameViewEvents> {
    
    // MARK: -
    // MARK: IBOutlets
    
    @IBOutlet private var leaderboardButton: UIButton?
    @IBOutlet private var botImage: UIImageView?
    @IBOutlet private var userImage: UIImageView?
    @IBOutlet private var playGameButton: UIButton?
    
    @IBOutlet private var scoreView: ScoreView?
    
    // MARK: -
    // MARK: Public
    
    public func configureScoreView(user: String) {
        self.scoreView?.configureScoreView(user: user)
    }
    
    public func scoreViewUpdate(botScore: String, userScore: String) {
        self.scoreView?.setupScoreView(botScore: botScore, userScore: userScore )
    }
    
    public func setupGameImages(botImage: String, userImage: String) {
        self.botImage?.image = UIImage(named: botImage)
        self.userImage?.image = UIImage(named: userImage)
    }
    
    // MARK: -
    // MARK: Private

    private func animateCubes() {
        UIView.animate(
            withDuration: 0.8,
            delay: 0,
            usingSpringWithDamping: 5,
            initialSpringVelocity: 0.3,
            animations: { [weak self] in
                self?.botImage?.transform = CGAffineTransform(scaleX: 5, y: 5)
                self?.botImage?.transform = CGAffineTransform(rotationAngle: .pi)
                self?.botImage?.transform = .identity

                self?.userImage?.transform = CGAffineTransform(scaleX: 5, y: 5)
                self?.userImage?.transform = CGAffineTransform(rotationAngle: .pi)
                self?.userImage?.transform = .identity
            },
            completion: nil
        )
    }
    
    private func animateScoreView() {
        UIView.transition(
            with: self.scoreView ?? UIView(),
            duration: 0.5,
            options: .transitionFlipFromTop,
            animations:
                { [weak self] in
                    self?.scoreView?.transform = CGAffineTransform(scaleX: 4, y: 4)
                    self?.scoreView?.transform = .identity
                },
            completion: nil)
    }
    
    private func animateLeaderBoardButton() {
        self.leaderboardButton?.center.x -= self.bounds.width
        
        UIView.animate(withDuration: 0.5) {  [weak self] in
            self?.leaderboardButton?.center.x += self?.bounds.height ?? CGFloat()
        }
    }
    
    // MARK: -
    // MARK: Ovverided
    
    override func setupView() {
        super.setupView()
        
        self.backgroundColor = UIColor(patternImage: UIImage(named: "background") ?? UIImage())
        self.animateScoreView()
        self.animateLeaderBoardButton()
    }
    
    // MARK: -
    // MARK: IBActions
    
    @IBAction func leaderBoardButton(_ sender: UIButton) {
        self.eventHandler?(.needDisplayLeaderBoard)
    }
    
    @IBAction func playGame(_ sender: UIButton) {
        self.eventHandler?(.updateDices)
        self.animateCubes()
        self.animateScoreView()
    }
}
