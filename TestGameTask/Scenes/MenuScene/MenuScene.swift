//
//  MenuScene.swift
//  TestGameTask
//
//  Created by csd_setup on 27.08.2024.
//

import SpriteKit

final class MenuScene: SKScene{
    // MARK: - Properties
    
    var title = TitleNode(title: "TEST GAME")
    var coins = ScoreCountNode()
    var background = BackgroundMenuNode()
    var playButton = PlayButtonNode()
    
    // MARK: - System
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        setupMenu()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        if let touch = touches.first{
            let pos = touch.location(in: self)
            let node = self.nodes(at: pos).first
            
            if node == playButton{
                playButton.buttonPressed(view: view)
            }
        }
    }
    
}

// MARK: - Configuration

private extension MenuScene{
    
    func setupMenu(){
        addChilds([
            background,
            playButton,
            title,
            coins
        ])
    }
}
