//
//  ContentView.swift
//  The Button
//
//  Created by Max Liu on 7/14/26.
//

import SwiftUI

struct ContentView: View {
    @State var totalPresses = 0
    @State private var isPressed = false
        
    var body: some View {
        ZStack {
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            VStack(spacing: 40) {
                Text("TOTAL PRESSES: \(totalPresses)").fontWeight(.bold)
                
                Spacer()
                ZStack {
                    Circle()
                        .fill(Color.red)
                        .brightness(-0.3)
                        .frame(width: 160, height: 160)
                        .offset(y: 12)
                    Circle()
                        .fill(Color.red)
                        .frame(width: 160, height: 160)
                        .offset(y: isPressed ? 10 : 0)
                        .shadow(
                            color: Color.black.opacity(isPressed ? 0.1 : 0.3),
                            radius: isPressed ? 2 : 8,
                            x: 0,
                            y: isPressed ? 2 : 6
                        )
                        .animation(.spring(response: 0.15, dampingFraction: 0.6), value: isPressed)
                }
                .gesture(
                    DragGesture(minimumDistance: 0)
                        .onChanged { _ in
                            isPressed = true
                        }
                        .onEnded { _ in
                            isPressed = false
                            onPress()
                            totalPresses += 1
                        }
                )
                Spacer()
            }
        }
        .overlay(
            OverlayView(manager: overlayManager)
        )
    }
}

#Preview {
    ContentView()
}
