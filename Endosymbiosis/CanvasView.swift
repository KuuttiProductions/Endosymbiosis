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
    @State var inMenu: Bool = true
    @FocusState var menu: Bool
    
    var body: some View {
        VStack {
            GameView()
                .overlay(alignment: Alignment(horizontal: .center,
                                              vertical: .top)) {
                    HStack {
                        Text("Selected: \(center.selected)")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text(ViewCenter.shared.hint)
                            .fontWeight(.semibold)
                        Text("Score: \(center.score)")
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .font(.largeTitle)
                    .fontDesign(.rounded)
                    .fontWeight(.medium)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.regularMaterial)
                }
        }
        .sheet(isPresented: $inMenu, content: {
            VStack {
                Text("menu.title")
                    .font(.largeTitle)
                    .fontDesign(.rounded)
                    .fontWeight(.semibold)
                    .padding()
                ScrollView {
                    Text("menu.description")
                        .fixedSize(horizontal: false, vertical: true)
                        .multilineTextAlignment(.center)
                    Link("menu.howToPlay", destination: URL(string: "https://github.com/KuuttiProductions/Endosymbiosis")!)
                }
                .frame(minHeight: 100, idealHeight: 130, maxHeight: 500)
                Button {
                    inMenu = false
                    InputManager.captureMouse()
                    InputManager.acceptInput()
                } label: {
                    Label("menu.start", systemImage: "gamecontroller.fill")
                }
                .buttonStyle(.borderedProminent)
                .tint(.blue)
                .controlSize(.extraLarge)
                .padding()
            }
            .frame(maxWidth: 500)
            .focused($menu)
            .padding()
        })
    }
}

#Preview {
    CanvasView()
}
