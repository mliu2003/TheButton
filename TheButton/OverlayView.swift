//
//  OverlayView.swift
//  TheButton
//
//  Created by Max Liu on 7/16/26.
//

import SwiftUI

struct OverlayView: View {
    var manager: OverlayManager
    
    var body: some View {
        Group {
            switch manager.activeEffect {
                case .none:
                    EmptyView()
                    
                case .balloons:
                    BalloonView().transition(.opacity)
            }
        }
        .allowsHitTesting(false)
    }
}
