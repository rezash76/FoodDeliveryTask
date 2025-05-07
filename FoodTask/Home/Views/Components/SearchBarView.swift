//
//  SearchBarView.swift
//  FoodTask
//
//  Created by Reza Sharifi on 5/6/25.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            Image(.search)
                .frame(width: 20, height: 20)
            TextField("What are you craving?", text: $searchText)
                .foregroundStyle(Color(hex: 0xBDBDBD))
                .font(.system(size: 14, weight: .regular))
                .autocorrectionDisabled()
                .overlay(alignment: .trailing) {
                    Image(systemName: "xmark.circle.fill")
                        .padding()
                        .offset(x: 10)
                        .foregroundStyle(searchText.isEmpty ? Color.white : Color.black)
                        .opacity(searchText.isEmpty ? 0 : 1)
                        .onTapGesture {
                            searchText = ""
                            UIApplication.shared.endEditing()
                        }
                }
        }
        .padding(20)
        .frame(height: 56)
        .font(.headline)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(hex: 0xF5F5F5))
        )
        
    }
}

#Preview {
    SearchBarView(searchText: .constant(""))
}
