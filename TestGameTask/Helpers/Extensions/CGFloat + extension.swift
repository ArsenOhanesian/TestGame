//
//  CGFloat + extension.swift
//  TestGameTask
//
//  Created by csd_setup on 25.08.2024.
//

import CoreGraphics

public let π = CGFloat.pi

extension CGFloat {
    
    func radiansToDegrees() -> CGFloat {
        self * 180.0 / π
    }
    
    func degreesToRadians() -> CGFloat{
        self * π / 180.0
    }
    
    static func random() -> CGFloat{
        CGFloat(Float(arc4random()) / Float(0xFFFFFFFF))
    }
    
    static func random(min: CGFloat, max: CGFloat) -> CGFloat{
        assert(min < max)
        return CGFloat.random() * (max - min) + min
    }
}
