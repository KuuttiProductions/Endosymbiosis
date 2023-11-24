//
//  View.swift
//  CrynonDemoGame
//
//  Created by Kuutti Taavitsainen on 24.11.2023.
//

import SwiftUI
import Crynon

struct CanvasView: View {
    
    @State private var center = ViewCenter.shared
    
    var body: some View {
        VStack {
            GameView()
                .overlay(alignment: Alignment(horizontal: .center,
                                              vertical: .top)) {
                    HStack {
                        Text("Selected: \(center.selected)")
                        Text("Score: \(center.score)")
                            .font(.largeTitle)
                            .fontDesign(.rounded)
                            .fontWeight(.semibold)
                            .padding()
                    }
                    .frame(maxWidth: .infinity)
                    .background(.regularMaterial)
                }
        }
    }
}

#Preview {
    CanvasView()
}
