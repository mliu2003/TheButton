//
//  ContentView.swift
//  The Button
//
//  Created by Max Liu on 7/14/26.
//

import SwiftUI

struct ContentView: View {
    @State private var isTapped = false
    
    var body: some View {
        ZStack {
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            
            Button(action: {
                print("hi")
            }) {
                Circle()
                        .fill(Color.red)
                        .frame(width: 160, height: 160)
                        .shadow(color: .black.opacity(0.15), radius: 10, x: 0, y: 5)
//                Text(isTapped ? "Active" : "Tap")
//                    .font(.system(size: 24, weight: .bold, design: .rounded))
//                    .foregroundColor(.white)
//                    .frame(width: 160, height: 160)
//                    .background(isTapped ? Color.red : Color.red)
//                    .clipShape(Circle())
//                    .shadow(color: .black.opacity(0.15), radius: 10, x: 0, y: 5)
            }
        }
    }
}

#Preview {
    ContentView()
}
