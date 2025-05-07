//
//  NavbarButton.swift
//  FoodTask
//
//  Created by Reza Sharifi on 5/6/25.
//

import SwiftUI

struct NavbarButton: View {
    let iconImage: ImageResource
    var callback: () -> Void
    var body: some View {
        Button(action: callback) {
            ZStack {
                Circle()
                    .fill(.white)
                    .stroke(Color(hex: 0xEEEEEE), lineWidth: 1)
                    .frame(width: 48, height: 48)
                
                Image(iconImage)
                    .frame(width: 24, height: 24)
                    .foregroundColor(.black)
                
                Circle()
                    .fill(Color(hex: 0xF75555))
                    .frame(width: 6, height: 6)
                    .offset(x: 8, y: -6)
            }
        }
    }
}

#Preview {
    NavbarButton(iconImage: .bag) {
        print("")
    }
}
