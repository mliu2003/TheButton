//
//  ButtonHelper.swift
//  TheButton
//
//  Created by Max Liu on 7/15/26.
//
import SwiftUI
import AVFAudio

class SoundManager {
    var player: AVAudioPlayer?
    
    func play(soundName: String, type: String = "mp3") {
        if let url = Bundle.main.url(forResource: soundName, withExtension: type) {
            do {
                player = try AVAudioPlayer(contentsOf: url)
                player?.play()
            } catch {
                print("Error loading sound file: \(error.localizedDescription)")
            }
        }
    }
}

let overlayManager = OverlayManager()
let soundManager = SoundManager()

var stats: [String: Int] = [:]

let basicActions: [() -> String] = [
    pop,
    nothing
]
let rareActions: [() -> String] = [
    redblue,
    grow
]
let legendaryActions: [() -> String] = [
    balloons,
    trophy
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
    
    stats[result, default: 0] += 1
    print(result)
    print (stats)
    rollText = result
}

func getResult(actions: [() -> String]) -> () -> String {
    let random = Int.random(in: 0..<actions.count)
    return actions[random]
}

// Basic
func pop() -> String {
    soundManager.play(soundName: "pop", type: "wav")
    return "pop"
}

func nothing() -> String {
    return "nothing"
}

func redblue() -> String {
    buttonColor = (buttonColor == Color.red ? Color.blue : Color.red)
    return "red blue"
}

func grow() -> String {
    buttonRadius += 20.0
    return "grow"
}

func balloons() -> String {
    overlayManager.trigger(.balloons, duration: 4.0)
    return "balloons"
}

func trophy() -> String {
    overlayManager.permanentAdd(PermanentAddition.trophy)
    return "trophy"
}
