//
//  GameViewController.swift
//  TestGameTask
//
//  Created by csd_setup on 25.08.2024.
//

import UIKit
import SpriteKit
import GameplayKit

final class GameViewController: UIViewController {
    // MARK: - Properties
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scene = MenuScene(size: CGSize(width: 1179, height: 2556))
        scene.scaleMode = .fill
        
        guard let skView = view as? SKView else { return }
        skView.presentScene(scene)
//      skView.showsFPS = true
//      skView.showsNodeCount = true
//      skView.showsPhysics = true
//      skView.ignoresSiblingOrder = true
                  
    }
}
