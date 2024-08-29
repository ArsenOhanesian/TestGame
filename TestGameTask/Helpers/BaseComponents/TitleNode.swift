//
//  TitleNode.swift
//  TestGameTask
//
//  Created by csd_setup on 29.08.2024.
//

import SpriteKit

final class TitleNode: SKLabelNode{
    // MARK: - Properties
    
    private let title: String
    
    // MARK: - Initializer
    
    init(title: String) {
        self.title = title
        super.init()
        
        configureLabel()
        setPosition()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func configureLabel(){
        text = title
        fontColor = .black
        fontSize = 150
    }
    
    private func setPosition(){
        let windowSize = UIScreen.main.nativeBounds.size
        position = CGPoint(x: windowSize.width / 2.0,
                           y: windowSize.height / 2.0 + frame.height + 150)
    }
}
