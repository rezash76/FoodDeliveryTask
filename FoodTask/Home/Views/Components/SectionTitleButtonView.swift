//
//  SectionTitleButtonView.swift
//  FoodTask
//
//  Created by Reza Sharifi on 5/6/25.
//

import SwiftUI

struct SectionTitleButtonView: View {
    let title: String
    let action: () -> Void
    var body: some View {
        HStack(spacing: 16) {
            Text(title)
                .font(.system(size: 20, weight: .bold))
            Spacer()
            Text("See All")
                .font(.system(size: 16, weight: .bold))
                .foregroundStyle(Color(hex: 0x1BAC4B))
                .onTapGesture {
                    action()
                }
        }
    }
}

#Preview {
    SectionTitleButtonView(title: "title") {
        print("")
    }
}
