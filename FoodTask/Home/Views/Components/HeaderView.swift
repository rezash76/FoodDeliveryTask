//
//  HeaderView.swift
//  FoodTask
//
//  Created by Reza Sharifi on 5/6/25.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack(spacing: 18) {
            Image(.profile)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 48, height: 48)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Deliver to")
                    .font(.system(size: 16, weight: .regular))
                    .foregroundColor(Color(hex: 0x757575))
                
                HStack(spacing: 6) {
                    Text("Times Square")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(Color(hex: 0x212121))
                    
                    Image(.arrowdown)
                        .font(.system(size: 20))
                        .foregroundColor(Color.green)
                        .frame(width: 20, height: 20)
                }
            }
        }
    }
}

#Preview {
    HeaderView()
}
