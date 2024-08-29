//
//  Values.swift
//  TestGameTask
//
//  Created by csd_setup on 25.08.2024.
//

import Foundation

enum Res{
    enum PhysicCategories{
        static let player: UInt32 = 0b1
        static let coin: UInt32 = 0b10
        static let lightning: UInt32 = 0b100
        static let booster: UInt32 = 0b1000
    }
    
}

enum ItemType{
    case coin
    case lighting
    case booster
}

enum UpdateType{
    case life
    case progress
    case score
}

