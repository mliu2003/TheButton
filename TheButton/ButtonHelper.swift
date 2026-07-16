//
//  ButtonHelper.swift
//  TheButton
//
//  Created by Max Liu on 7/15/26.
//
import SwiftUI

let overlayManager = OverlayManager()

let basicActions: [() -> Void] = [
    basic1,
    basic2
]
let rareActions: [() -> Void] = [
    rare1
]

func onPress() {
    let roll = Double.random(in: 0..<100) // Returns a value like 42.7 or 91.3
        
    if roll < 90 {
        getResult(actions: basicActions)()
    } else {
        getResult(actions: rareActions)()
    }
}

func getResult(actions: [() -> Void]) -> () -> Void {
    let random = Int.random(in: 0..<actions.count)
    return actions[random]
}

func basic1() -> Void {
    print("basic 1")
}
func basic2() -> Void {
    print("basic 2")
}
func rare1() -> Void {
    print("HUGE WIN")
    overlayManager.trigger(.balloons, duration: 4.0)
}
