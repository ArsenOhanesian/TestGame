//
//  LightningNode.swift
//  TestGameTask
//
//  Created by csd_setup on 28.08.2024.
//

import SpriteKit

final class LightningNode: BaseSpriteNode{
    // MARK: - Properties
    
    private let sprite = SKTexture(imageNamed: "bold")
    
    // MARK: - Initializer
    
    init(){
        super.init(texture: sprite, color: .clear, size: sprite.size())
        setScale(2.5)
        setPhysics()
        setTimeOut()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func setPhysics(){
        let physicBody = SKPhysicsBody(rectangleOf: self.size)
        physicBody.affectedByGravity = false
        physicBody.isDynamic = false
        physicBody.categoryBitMask = Res.PhysicCategories.lightning
        physicBody.contactTestBitMask = Res.PhysicCategories.player
        self.physicsBody = physicBody
    }
    
    private func setTimeOut(){
        run(.sequence([.wait(forDuration: 5.0), .removeFromParent()]))
    }
    
    // MARK: - Public Methods
    
    override func setPosition(windowSize: CGSize, cameraRect: CGRect){
        let lightningHeight = frame.height
        let randomY = CGFloat.random(min: 230 + lightningHeight,
                                     max: windowSize.height - 230 - lightningHeight / 2.0)
        
        position = CGPoint(x: cameraRect.maxX + frame.width / 2.0 , y: randomY)
       
    }
}
