//
//  BoosterNode.swift
//  TestGameTask
//
//  Created by csd_setup on 28.08.2024.
//

import SpriteKit

final class BoosterNode: BaseSpriteNode{
    // MARK: - Properties
    
    private let sprite = SKTexture(imageNamed: "booster-1")
    
    // MARK: - Initializer
    
    init(){
        super.init(texture: sprite, color: .clear, size: sprite.size())
        setScale(0.7)
        setAnimation()
        setPhysics()
        setTimeOut()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Properties
    
    private func setAnimation(){
        var textures: [SKTexture] = []
        for i in 1...6 {
            textures.append(SKTexture(imageNamed: "booster-\(i)"))
        }
        
        run(.repeatForever(.animate(with: textures, timePerFrame: 0.20)))
    }
    
    private func setPhysics(){
        let physicBody = SKPhysicsBody(rectangleOf: self.size)
        physicBody.affectedByGravity = false
        physicBody.isDynamic = false
        physicBody.categoryBitMask = Res.PhysicCategories.booster
        physicBody.contactTestBitMask = Res.PhysicCategories.player
        self.physicsBody = physicBody
    }
    
    private func setTimeOut(){
        run(.sequence([.wait(forDuration: 5.0), .removeFromParent()]))
    }
    
    // MARK: - Public Methods
    
    override func setPosition(windowSize: CGSize, cameraRect: CGRect){
        let boosterHeight = frame.height
        let randomY = CGFloat.random(min: 230 + boosterHeight, max: windowSize.height - 230 - boosterHeight)
        position = CGPoint(x: cameraRect.maxX + frame.width / 2.0, y: randomY)
    }
}
