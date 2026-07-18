//
//  ButtonHelper.swift
//  TheButton
//
//  Created by Max Liu on 7/15/26.
//
import SwiftUI

let overlayManager = OverlayManager()

let basicActions: [() -> String] = [
    basic1,
    basic2
]
let rareActions: [() -> String] = [
    rare1,
    rare2
]
let legendaryActions: [() -> String] = [
    legendary1
]

func onPress() {
    let roll = Double.random(in: 0..<100)
    var result = ""
    if roll < 80 {
        result = getResult(actions: basicActions)()
    } else if roll < 90 {
        result = getResult(actions: rareActions)()
    } else {
        result = getResult(actions: legendaryActions)()
    }
    print(result)
    rollText = result
}

func getResult(actions: [() -> String]) -> () -> String {
    let random = Int.random(in: 0..<actions.count)
    return actions[random]
}

func basic1() -> String {
    return "basic 1"
}
func basic2() -> String {
    return "basic 2"
}
func rare1() -> String {
    buttonColor = (buttonColor == Color.red ? Color.blue : Color.red)
    return "rare find 1"
}

func rare2() -> String {
    buttonRadius += 20.0
    return "rare find 2"
}

func legendary1() -> String {
    overlayManager.trigger(.balloons, duration: 4.0)
    return "LEGENDARY WIN"
}
