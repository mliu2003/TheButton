//
//  BalloonView.swift
//  TheButton
//
//  Created by Max Liu on 7/16/26.
//

import SwiftUI

struct BalloonView: View {
    // 1. A list of random horizontal percentages and sizes to make the layout look natural
    let balloonData: [(xPercent: CGFloat, scale: CGFloat, delay: Double, color: Color)] = [
        (0.15, 0.9, 0.0, .red),
        (0.35, 1.2, 0.3, .blue),
        (0.50, 0.8, 0.15, .yellow),
        (0.65, 1.1, 0.5, .green),
        (0.85, 1.0, 0.2, .orange)
    ]
    
    // 2. State variable that we will animate to drive the movement
    @State private var animateUp = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0..<balloonData.count, id: \.self) { index in
                    let data = balloonData[index]
                    
                    // Simple text emoji balloon (styled to look great)
                    Text("🎈")
                        .font(.system(size: 60))
                        .colorMultiply(data.color) // Tint the balloon to different colors!
                        .scaleEffect(data.scale)
                        // Position horizontally using the pre-defined percentages
                        .position(
                            x: geometry.size.width * data.xPercent,
                            // Animate vertically from off-screen bottom to off-screen top
                            y: animateUp ? -100 : geometry.size.height + 100
                        )
                        // Stagger the launches so they drift up organically
                        .animation(
                            .easeInOut(duration: 4.0)
                            .delay(data.delay),
                            value: animateUp
                        )
                }
            }
            .onAppear {
                // Immediately trigger the animation as soon as the view is mounted
                animateUp = true
            }
        }
        // Allows the user to tap the 3D button underneath even while balloons are on screen
        .allowsHitTesting(false)
    }
}
