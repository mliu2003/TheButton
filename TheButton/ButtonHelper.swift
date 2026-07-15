//
//  ButtonHelper.swift
//  TheButton
//
//  Created by Max Liu on 7/15/26.
//

let actions: [() -> Void] = [
    basic1,
    basic2
]
func onPress() {
    let random = Int.random(in: 0..<actions.count)
    actions[random]()
}

func basic1() -> Void {
    print("basic 1")
}
func basic2() -> Void {
    print("basic 2")
}
