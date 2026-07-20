//
//  OverlayManager.swift
//  TheButton
//
//  Created by Max Liu on 7/16/26.
//

import SwiftUI

enum OverlayEffect {
    case none
    case balloons
}

enum PermanentAddition: String, CaseIterable {
    case trophy = "🏆"
    case present = "🎁"
}

@Observable
class OverlayManager {
    var activeEffect: OverlayEffect = .none
    
    var permanentAdditions: [PermanentAddition] = []
    
    func trigger(_ effect: OverlayEffect, duration: Double = 5.0) {
        activeEffect = effect
        
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            withAnimation {
                // Only clear if another effect hasn't overridden it in the meantime
                if self.activeEffect == effect {
                    self.activeEffect = .none
                }
            }
        }
    }
    
    func permanentAdd(_ addition: PermanentAddition) {
        permanentAdditions.append(addition)
    }
}
