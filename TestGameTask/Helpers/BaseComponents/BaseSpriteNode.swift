//
//  BaseSpriteNode.swift
//  TestGameTask
//
//  Created by csd_setup on 28.08.2024.
//

import SpriteKit

class BaseSpriteNode: SKSpriteNode{
    
    // MARK: - Initializer
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    
    @objc func setPosition(windowSize: CGSize, cameraRect: CGRect) {
        
    }
}
