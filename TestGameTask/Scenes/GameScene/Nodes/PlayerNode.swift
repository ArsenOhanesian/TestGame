//
//  Player.swift
//  TestGameTask
//
//  Created by csd_setup on 28.08.2024.
//

import SpriteKit

final class PlayerNode: SKSpriteNode{
    
    // MARK: - Properties
    
    private let sprite = SKTexture(imageNamed: "ghost-1")
    private var velocityY: CGFloat = 0.0
    
    var gravity: CGFloat = 0.5

    var isFlying: Bool {
        didSet{
            gravity = -gravity
            zRotation = isFlying ? CGFloat(20).degreesToRadians() : 0
        }
    }
    
    // MARK: - Initializer
    
    init(){
        self.isFlying = false
        super.init(texture: sprite, color: .clear, size: sprite.size())
        setTexture()
        setPosition()
        setPhysics()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func setTexture(){
        var textures: [SKTexture] = []
        for i in 1...13{
            textures.append(SKTexture(imageNamed: "ghost-\(i)"))
        }
        self.run(.repeatForever(.animate(with: textures, timePerFrame: 0.20)))
    }
    
    private func setPosition(){
        zPosition = 5.0
        position = CGPoint(x: 0 + self.frame.width / 2,
                           y: size.height / 2.0 + self.frame.height / 2)
    }
    
    private func setPhysics(){
        let physicBody = SKPhysicsBody(rectangleOf: self.size)
        physicBody.affectedByGravity = false
        physicBody.restitution = 0.0
        physicBody.categoryBitMask = Res.PhysicCategories.player
        physicBody.contactTestBitMask = Res.PhysicCategories.lightning | Res.PhysicCategories.coin
        self.physicsBody = physicBody
    }
    
    // MARK: - Public Methods
    func move(amount: CGFloat){
        velocityY += gravity
        position = CGPoint(x: position.x + amount, y: position.y - velocityY)
    
        if position.y <= 0{
            position.y = 0
            velocityY = 0
        }
    }
}
