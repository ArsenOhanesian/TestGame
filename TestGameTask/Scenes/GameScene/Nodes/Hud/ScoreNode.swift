//
//  ScoreNode.swift
//  TestGameTask
//
//  Created by csd_setup on 28.08.2024.
//

import SpriteKit

final class ScoreNode: SKNode{
    // MARK: - Properties
    
    private var score: Int = UserDefaults.standard.integer(forKey: "coins")
    private var icon: SKSpriteNode!
    private var scoreCount: SKLabelNode!
    private var gameRect: CGRect
    
    // MARK: - Initializer

    init(gameRect: CGRect) {
        self.gameRect = gameRect
        super.init()
        setupScore()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods

    private func setupScore(){
        setupIcon()
        setupScoreCount()
        setPosition()
    }
    
    private func setupIcon(){
        icon = SKSpriteNode(imageNamed: "coinIcon")
        icon.position = CGPoint(x: frame.width / 2.0 - icon.frame.width,
                                y: frame.height / 2.0 - icon.frame.height)
        icon.zPosition = 50.0
        icon.setScale(0.7)
        addChild(icon)
    }
    
    private func setupScoreCount(){
        scoreCount = SKLabelNode(text: "\(score)")
        scoreCount.position = CGPoint(x: icon.position.x - icon.frame.width - scoreCount.frame.width,
                                      y: icon.position.y - scoreCount.frame.height)
        scoreCount.zPosition = 50.0
        configureText()
        addChild(scoreCount)
    }
    
    private func configureText(){
        scoreCount.fontSize = icon.frame.height / 1.5
        scoreCount.fontColor = .black
    }
    
    
    private func setPosition(){
        let width = gameRect.width
        let height = gameRect.height
        
        position = CGPoint(x: width / 2.0 - frame.width,
                           y: height / 2.0 - frame.height - 123 )
    }
    
    // MARK: - Public Methods

    func contactWithPlayer(){
        score += 1
        scoreCount.text = "\(score)"
    }
}
