//
//  Background.swift
//  TestGameTask
//
//  Created by csd_setup on 29.08.2024.
//

import SpriteKit

final class BackgroundMenuNode: SKSpriteNode{
    // MARK: - Properties
    
    private let sprite = SKTexture(imageNamed: "menuBackground")
    
    // MARK: - Initializer
    
    init(){
        super.init(texture: sprite, color: .clear, size: sprite.size())
        setPosititon()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func setPosititon(){
        anchorPoint = .zero
        position = .zero
        zPosition = -1.0
    }
    
    
}
