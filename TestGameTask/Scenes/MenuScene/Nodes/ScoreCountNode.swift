//
//  ScoreNode.swift
//  TestGameTask
//
//  Created by csd_setup on 29.08.2024.
//

import SpriteKit

final class ScoreCountNode: SKLabelNode {
    // MARK: - Properties
    
    private let title = "Coins: "
    private let score = UserDefaults.standard.integer(forKey: "coins")
    
    // MARK: - Initializer
    
    override init() {
        super.init()
        configureLabel()
        setPosition()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func configureLabel(){
        text = title + "\(score)"
        fontSize = 100
        fontColor = .black
    }
    
    private func setPosition(){
        let windowSize = UIScreen.main.nativeBounds.size
        position = CGPoint(x: windowSize.width / 2.0,
                           y: windowSize.height / 2.0 + 150 - frame.height / 2.0)
    }
}
