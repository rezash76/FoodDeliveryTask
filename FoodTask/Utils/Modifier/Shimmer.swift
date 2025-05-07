//
//  Modifiers.swift
//  FoodTask
//
//  Created by Reza Sharifi on 5/7/25.
//

import SwiftUI

public struct Shimmer: ViewModifier {
    
    @State var isInitialState: Bool = true
    
    public func body(content: Content) -> some View {
        content
            .mask {
                LinearGradient(
                    gradient: .init(colors: [.black.opacity(0.4), .black, .black.opacity(0.4)]),
                    startPoint: (isInitialState ? .init(x: -0.3, y: -0.3) : .init(x: 1, y: 1)),
                    endPoint: (isInitialState ? .init(x: 0, y: 0) : .init(x: 1.3, y: 1.3))
                )
            }
            .animation(.linear(duration: 1.2).repeatForever(autoreverses: false), value: isInitialState)
            .onAppear() {
                isInitialState = false
            }
    }
}

extension View {
    @ViewBuilder
    func shimmer(when isLoading: Bool) -> some View {
        if isLoading {
            self.modifier(Shimmer())
                .redacted(reason: isLoading ? .placeholder : [])
        } else {
            self
        }
    }
}
