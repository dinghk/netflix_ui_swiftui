//
//  SearchBar.swift
//  MyNetflix
//
//  Created by Ding Lo on 22/7/2024.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    @State private var isEditing = true
    @Binding var isLoading: Bool
    
    let screen = UIScreen.main.bounds
    
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color.gray)
                    .padding(.leading, 10)
                
                TextField("Search", text: $text, onEditingChanged: { isEditing in
                    self.isEditing = isEditing
                })
                .foregroundColor(.white)
                .padding(7)
                .padding(.leading, -7)
                .padding(.horizontal, 10)
                
                if !text.isEmpty {
                    if isLoading {
                        ActivityIndicator(style: .medium, animate: .constant(true))
                            .configure {
                                $0.color = .white
                            }
                            .frame(width: 35, height: 35)
                            .padding(.trailing, 10)
                    } else {
                        Button(action: {
                            text = ""
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(Color.gray)
                                .frame(width: 35, height: 35)
                        }
                        .padding(.trailing, 10)
                    }
                }
            }
            .frame(height: 36) // Set the height of the TextField
            .background(Color.gray.opacity(0.2))
            .cornerRadius(8)
            
            if isEditing {
                Button(action: {
                    text = ""
                    isEditing = false
                    hideKeyboard()
                }) {
                    Text("Cancel")
                        .foregroundColor(.white)
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                .animation(.default, value: 1)
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    ZStack {
        Color.black
            .edgesIgnoringSafeArea(.all)
        
        SearchBar(text: .constant(""), isLoading: .constant(false))
            .padding()
    }
}
