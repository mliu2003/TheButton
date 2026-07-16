//
//  OverlayView.swift
//  TheButton
//
//  Created by Max Liu on 7/16/26.
//

import SwiftUI

struct OverlayView: View {
    // Bind to the shared state manager
    var manager: OverlayManager
    
    var body: some View {
        Group {
            switch manager.activeEffect {
                case .none:
                    EmptyView() // Renders nothing, uses zero layout space
                    
                case .balloons:
                BalloonView().transition(.opacity)
            }
        }
        .allowsHitTesting(false) // Ensures users can tap through animations to keep playing
    }
}
