//
//  BackButtonNode.swift
//  TestGameTask
//
//  Created by csd_setup on 29.08.2024.
//

import SpriteKit

final class BackButtonNode: SKSpriteNode{
    // MARK: - Properties
    
    private let sprite = SKTexture(imageNamed: "backBtn")
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
        zPosition = 50.0
        position = CGPoint(x: windowSize.width / 2.0,
                           y: windowSize.height / 2.0 - 40 - frame.height)
    }
    
    // MARK: - Public Methods
    
    func buttonTapped(view: SKView?){
        guard let view else { return }
        let scene = MenuScene(size: windowSize)
        scene.scaleMode = .aspectFill
        view.presentScene(scene)
    }
}
