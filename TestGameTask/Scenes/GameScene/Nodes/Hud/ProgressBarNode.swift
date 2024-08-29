//
//  ProgressBarNode.swift
//  TestGameTask
//
//  Created by csd_setup on 28.08.2024.
//

import SpriteKit

final class ProgressBarNode: SKNode{
    // MARK: - Properties
    
    private var progress: CGFloat = 30
    private var maxProgress: CGFloat = 30
    
    private var progressBar = SKSpriteNode()
    private var progressBarContainer = SKSpriteNode()
    
    private let progressTexture = SKTexture(imageNamed: "progressBarItem")
    private let progressContainerTexture = SKTexture(imageNamed: "progressBarContainer")
    
    private var playableRect: CGRect
    
    // MARK: - Initializer
    
    init(playableRect: CGRect){
        self.playableRect = playableRect
        super.init()
        
        createProgressBar()
        setPosition()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods
    private func createProgressBar(){
        progressBarContainer = SKSpriteNode(texture: progressContainerTexture,
                                            size: progressContainerTexture.size())
        
        progressBar = SKSpriteNode(texture: progressTexture, size: progressTexture.size())
        progressBar.size.width = progressTexture.size().width * maxProgress
        
        addChild(progressBarContainer)
        addChild(progressBar)
    }
    
    private func setPosition(){
        progressBarContainer.zPosition = 0
        progressBar.zPosition = 1
        
        position = CGPoint(
            x: -playableRect.width / 2.0 + progressBarContainer.frame.width / 2.0 + 93 ,
            y: playableRect.height / 2.0 - progressBarContainer.frame.height + 100)
        
        progressBar.position = progressBarContainer.position
    }
    
    // MARK: - Public Methods
    func updateProgress(with value: CGFloat){
        progress += value
        if progress >= maxProgress {
            progress = maxProgress
        }
        progressBar.size.width = progressTexture.size().width * progress
    }
  
    
}
