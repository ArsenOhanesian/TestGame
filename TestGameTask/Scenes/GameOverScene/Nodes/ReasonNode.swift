//
//  ReasonNode.swift
//  TestGameTask
//
//  Created by csd_setup on 29.08.2024.
//

import SpriteKit

final class ReasonNode: SKLabelNode{
    // MARK: - Properties
    
    private let reason: String
    
    // MARK: - Initializer
    
    init(reason: String){
        self.reason = reason
        super.init()
        
        configureLabel()
        setPosition()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func configureLabel(){
        text = reason
        fontColor = .black
        fontSize = 100
    }
    
    private func setPosition(){
        let windowSize = UIScreen.main.nativeBounds.size
        position = CGPoint(x: windowSize.width / 2.0,
                           y: windowSize.height / 2.0 + 150 - frame.height / 2.0)
    }
}
