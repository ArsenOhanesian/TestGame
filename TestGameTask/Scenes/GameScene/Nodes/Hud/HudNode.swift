//
//  HudNode.swift
//  TestGameTask
//
//  Created by csd_setup on 28.08.2024.
//

import SpriteKit

final class HudNode: SKNode{
    // MARK: - Properties
    
    private var windowFrame: CGRect
    private var lifes: LifeNode!
    private var score: ScoreNode!
    private var time: ProgressBarNode!
    
    private var playableRect: CGRect{
        let ratio: CGFloat
        switch UIScreen.main.nativeBounds.height{
        case 2688, 2436, 1792: ratio = 2.16
        default: ratio = 9/16
        }
        let playableHeight = windowFrame.width / ratio
        let playableMargin = (windowFrame.height - playableHeight) / 2.0
        return CGRect(x: 0.0, y: playableMargin, width: windowFrame.width, height: playableHeight)
    }
    
    // MARK: - Initializer
    
    init(windowFrame: CGRect) {
        self.windowFrame = windowFrame
        super.init()
        setupHud()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func setupHud(){
        setLifes()
        setScore()
        setTime()
    }
    
    private func setLifes(){
        lifes = LifeNode(gameRect: playableRect)
        addChild(lifes)
    }
    
    private func setScore(){
        score = ScoreNode(gameRect: playableRect)
        addChild(score)
    }
    
    private func setTime(){
        time = ProgressBarNode(playableRect: playableRect)
        addChild(time)
    }
    
    // MARK: - Public Methods
    
    func contactWithPlayer(type: UpdateType, value: CGFloat = 0){
        switch type {
        case .life:
            lifes.contactWithPlayer()
        case .progress:
            time.updateProgress(with: value)
        case .score:
            score.contactWithPlayer()
        }
       
    }
}
