//
//  ContentView.swift
//  The Button
//
//  Created by Max Liu on 7/14/26.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        ZStack {
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            
            Button(action: {
                onPress()
            }) {
                Circle()
                    .fill(Color.red)
                    .frame(width: 160, height: 160)
                    .shadow(color: .black.opacity(0.15), radius: 10, x: 0, y: 5)
            }
        }
    }
}

#Preview {
    ContentView()
}
