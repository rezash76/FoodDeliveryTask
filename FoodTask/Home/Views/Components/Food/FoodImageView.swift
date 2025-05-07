//
//  FoodImageView.swift
//  FoodTask
//
//  Created by Reza Sharifi on 5/7/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct FoodImageView: View {
    let urlString: String
    let size: CGFloat
    let cornerRadius: CGFloat = 20
    
    var body: some View {
        WebImage(url: URL(string: urlString)) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: size, height: size)
                .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
        } placeholder: {
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(Color.gray.opacity(0.1))
        }
        .indicator(.activity)
        .frame(width: size, height: size)
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
    }
}

#Preview {
    FoodImageView(urlString: "", size: 120)
}
