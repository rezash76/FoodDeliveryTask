//
//  BannerSliderView.swift
//  FoodTask
//
//  Created by Reza Sharifi on 5/6/25.
//

import SwiftUI
import Combine
import SDWebImageSwiftUI

struct BannerSliderView: View {
    let imageUrls: [String]
    let onTap: ((String) -> Void)?
    
    private let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    
    @State private var currentIndex = 0
    
    var body: some View {
        return TabView(selection: $currentIndex) {
            ForEach(imageUrls.indices, id: \.self) { index in
                WebImage(url: URL(string: imageUrls[index])) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .tag(index)
                } placeholder: {
                    Rectangle().foregroundColor(.gray)
                }
                .indicator(.activity)
                .transition(.fade(duration: 0.5))
                .onTapGesture {
                    onTap?(imageUrls[index])
                }
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .frame(height: 180)
        .shadow(color: Color(hex: 0x1BAC4B).opacity(0.25), radius: 24, x: 4, y: 8)
        .onReceive(timer) { _ in
            withAnimation {
                currentIndex = (currentIndex + 1) % imageUrls.count
            }
        }
    }
}

#Preview {
    BannerSliderView(imageUrls: [""], onTap: nil)
}
