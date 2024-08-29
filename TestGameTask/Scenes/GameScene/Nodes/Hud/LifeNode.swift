//
//  LifeNode.swift
//  TestGameTask
//
//  Created by csd_setup on 28.08.2024.
//

import SpriteKit

final class LifeNode: SKNode{
    // MARK: - Properties
    
    private let lifeTexture = SKTexture(imageNamed: "life-1")
    private var gameRect: CGRect
    private var lifes = 3
    
    // MARK: - Initializer

    init(gameRect: CGRect) {
        self.gameRect = gameRect
        super.init()
        setupLifes()
        setPosition()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Private Methods

    private func setupLifes(){
        for i in 0...2{
            let node = SKSpriteNode(imageNamed: "life-1")
            node.name = "Life-\(i+1)"
            node.setScale(0.5)
            setLifePosition(node: node, i: CGFloat(i+1), j: CGFloat((i-1))*8)
        }
    }
    
    private func setLifePosition(node: SKSpriteNode, i: CGFloat, j: CGFloat){
        let width = frame.width
        let height = frame.height
        node.zPosition = 50
        node.position = CGPoint(x: width / 2.0 - node.frame.width * i - j - 15,
                                y: height / 2.0 - node.frame.height / 2.0)
        
        addChild(node)
    }
    
    private func setPosition(){
        let width = gameRect.width
        let height = gameRect.height
        
        position = CGPoint(x: width / 2.0 - frame.width,
                           y: height / 2.0 - frame.height / 2.0)
    }
    
    // MARK: - Public Methods

    func contactWithPlayer(){
        childNode(withName: "Life-\(lifes)")?.removeFromParent()
        lifes -= 1
    }
}
