//
//  PlayButtonNode.swift
//  TestGameTask
//
//  Created by csd_setup on 29.08.2024.
//

import SpriteKit

final class PlayButtonNode: SKSpriteNode{
    // MARK: - Properties
    
    private let sprite = SKTexture(imageNamed: "playBtn")
    private let windowSize = UIScreen.main.nativeBounds.size
    
    // MARK: - Initializer
    
    init(){
        super.init(texture: sprite, color: .clear, size: sprite.size())
        setPosition()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func setPosition(){
        position = CGPoint(x: windowSize.width / 2.0,
                           y: windowSize.height / 2.0 - frame.height - 50)
    }
    
    // MARK: - Public Methods
    
    func buttonPressed(view: SKView?){
        guard let view else { return }
        let scene = GameScene(size: windowSize)
        scene.scaleMode = .aspectFit
        view.presentScene(scene)
    }
}
