//
//  BackgroundNode.swift
//  TestGameTask
//
//  Created by csd_setup on 28.08.2024.
//

import SpriteKit

final class BackgroundNode: SKSpriteNode{
    // MARK: - Properties
    
    private let sprite = SKTexture(imageNamed: "background")
    
    // MARK: - Initializer
    
    init(index: Int){
        super.init(texture: sprite, color: .clear, size: sprite.size())
        setPosition(index: index)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func setPosition(index: Int){
        anchorPoint = .zero
        position = CGPoint(x: CGFloat(index) * frame.width, y: 0.0)
        zPosition = -1.0
    }
    
    // MARK: - Public Methods
    func moveForCamera(camera: CGRect){
        if position.x + frame.width < camera.origin.x{
            position = CGPoint(x: position.x + frame.width * 2.0, y: position.y)
        }
    }
}
