//
//  PermanentOverlayView.swift
//  TheButton
//
//  Created by Max Liu on 7/20/26.
//

import SwiftUI

struct PermanentOverlayView: View {
    var manager: OverlayManager
    
    var body: some View {
        VStack {
            HStack {
                if !manager.permanentAdditions.isEmpty {
                    ForEach(manager.permanentAdditions, id: \.self) { addition in
                        Text(addition.rawValue)
                            .font(.title2)
                            .transition(.scale.combined(with: .opacity))
                    }
                }
                
                Spacer()
            }
            .padding()
            .padding(.horizontal)
            .padding(.top, 100) // TODO find a better organization pattern
            
            Spacer()
        }
        .animation(.spring(response: 0.4, dampingFraction: 0.7), value: manager.permanentAdditions)
        .allowsHitTesting(false)
    }
}
