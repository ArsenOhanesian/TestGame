//
//  GameOverScene.swift
//  TestGameTask
//
//  Created by csd_setup on 27.08.2024.
//

import SpriteKit

final class GameOverScene: SKScene {
    // MARK: - Properties
    
    private var background = BackgroundMenuNode()
    private var backButton = BackButtonNode()
    private var title = TitleNode(title: "GAME OVER")
    private var reason: ReasonNode!
    
    // MARK: - Initializer
    
    init(reason: String, size: CGSize){
        self.reason = ReasonNode(reason: reason)
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Systems
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        setupScene()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        guard let touch = touches.first else { return }
        let pos = touch.location(in: self)
        let node = nodes(at: pos)
        
        if node.first == backButton{
            backButton.buttonTapped(view: view)
        }
    }
}

// MARK: - Configuration
private extension GameOverScene{
    
    func setupScene() {
        addChilds([
            background,
            title,
            reason,
            backButton
        ])
    }
}
