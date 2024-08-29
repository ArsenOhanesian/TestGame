//
//  SKScene + extension.swift
//  TestGameTask
//
//  Created by csd_setup on 29.08.2024.
//

import SpriteKit

extension SKScene {
    func addChilds(_ childs: [SKNode]){
        childs.forEach(addChild)
    }
}
