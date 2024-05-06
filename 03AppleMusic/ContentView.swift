//
//  ContentView.swift
//  03AppleMusic
//
//  Created by Aleksandr Menshikov on 06.05.2024.
//

import SwiftUI

struct ContentView: View {
    @State var isTapped = false
    @State var animationCount = 3
    
    var body: some View {
        VStack {
            Button(action: {
                showAnimate()
            }, label: {
                HStack(spacing: .zero) {
                    Image(systemName: "arrowtriangle.forward.fill")
                        .resizable()
                        .opacity(isTapped ? 1 : 0)
                        .frame(width: isTapped ? 20 : 0, height: isTapped ? 20 : 0)
                    Image(systemName: "arrowtriangle.forward.fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                    Image(systemName: "arrowtriangle.forward.fill")
                        .resizable()
                        .opacity(isTapped ? 0 : 1)
                        .frame(width: isTapped ? 1 : 20, height: isTapped ? 1 : 20)
                }
            })
        }
        .padding()
    }
    
    func showAnimate() {
        animationCount -= 1
        withAnimation(.smooth) {
            isTapped = true
        } completion: {
            isTapped = false
            if animationCount > 0 {
                showAnimate()
            } else {
                animationCount = 3
            }
        }
    }
}

#Preview {
    ContentView()
}
