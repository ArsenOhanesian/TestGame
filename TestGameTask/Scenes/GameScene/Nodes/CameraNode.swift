//
//  CameraNode.swift
//  TestGameTask
//
//  Created by csd_setup on 28.08.2024.
//

import SpriteKit

final class CameraNode: SKCameraNode{
    // MARK: - Properties
    private var windowFrame: CGRect
    
    var hud: HudNode!
    let movePointPerSecond: CGFloat = 450.0
    
    
    // MARK: - Initializer
    
    init(windowFrame: CGRect){
        self.windowFrame = windowFrame
        super.init()
        setPosition()
        setHud()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func setPosition(){
        position = CGPoint(x: windowFrame.midX, y: windowFrame.midY)
    }
    
    private func setHud(){
        hud = HudNode(windowFrame: windowFrame)
        addChild(hud)
    }
    
    // MARK: - Public Methods
    
    func moveCamera(amount: CGFloat){
        position.x += amount 
    }
    
    func update(_ type: UpdateType, value: CGFloat = 0){
        switch type {
        case .life:
            hud.contactWithPlayer(type: .life)
        case .progress:
            hud.contactWithPlayer(type: .progress, value: value)
        case .score:
            hud.contactWithPlayer(type: .score)
        }
    }
}
