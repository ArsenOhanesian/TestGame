//
//  CGPoint + extension.swift
//  TestGameTask
//
//  Created by csd_setup on 25.08.2024.
//

import CoreGraphics

func + (left: CGPoint, right: CGPoint) -> CGPoint{
    CGPoint(x: left.x + right.x, y: left.y + right.y)
}

func += (left: inout CGPoint, right: CGPoint){
    left = left + right
}

func - (left: CGPoint, right: CGPoint) -> CGPoint{
    CGPoint(x: left.x - right.x, y: left.y - right.y)
}

func -= (left: inout CGPoint, right: CGPoint) {
    left = left - right
}

func * (left: CGPoint, right: CGPoint) -> CGPoint{
    CGPoint(x: left.x * right.x, y: left.y * right.y)
}

func *= (left: inout CGPoint, right: CGPoint) {
    left = left * right
}

func / (left: CGPoint, right: CGPoint) -> CGPoint{
    CGPoint(x: left.x / right.x, y: left.y / right.y)
}

func /= (left: inout CGPoint, right: CGPoint) {
    left = left / right
}

func * (point: CGPoint, scalar: CGFloat) -> CGPoint{
    CGPoint(x: point.x * scalar, y: point.y * scalar)
}

func *= (point: inout CGPoint, scalar: CGFloat){
    point = point * scalar
}

func / (point: CGPoint, scalar: CGFloat) -> CGPoint{
    CGPoint(x: point.x / scalar, y: point.y / scalar)
}

func /= (point: inout CGPoint, scalar: CGFloat){
    point = point / scalar
}

