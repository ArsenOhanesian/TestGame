//
//  CoinNode.swift
//  TestGameTask
//
//  Created by csd_setup on 28.08.2024.
//

import SpriteKit

final class CoinNode: BaseSpriteNode{
    // MARK: - Initializer
    
    init(){
        let texture = SKTexture(imageNamed: "coin")
        super.init(texture: texture, color: .clear, size: texture.size())
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
        physicBody.categoryBitMask = Res.PhysicCategories.coin
        physicBody.contactTestBitMask = Res.PhysicCategories.player
        
        self.physicsBody = physicBody
    }
    
    private func setTimeOut(){
        run(.sequence([.wait(forDuration: 5.0), .removeFromParent()]))
    }
    
    // MARK: - Public Methods
    
    override func setPosition(windowSize: CGSize, cameraRect: CGRect){
        let coinHeight = self.frame.height
        let randomY = CGFloat.random(min: 230 + coinHeight, max: windowSize.height - 230 - coinHeight)
        
        position = CGPoint(x: cameraRect.maxX + self.frame.width / 2.0, y: randomY)
    }
}
