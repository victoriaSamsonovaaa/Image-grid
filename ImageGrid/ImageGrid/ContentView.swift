//
//  ContentView.swift
//  ImageGrid
//
//  Created by Victoria Samsonova on 11.09.24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var searchQuery = ""
    @State private var showAttentionalText = false
    
    let columns = [GridItem(.adaptive(minimum: 150), spacing: 16)]
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .padding(.leading, 10)
                        .foregroundColor(.secondary)
                    TextField("Search", text: $searchQuery)
                        .font(.title3)
                        .onChange(of: searchQuery) {
                            showAttentionalText = true
                        }
                    if searchQuery != "" {
                        Button(role: .cancel) {
                            remove()
                        } label: {
                            Label("", systemImage: "xmark")
                        }
                        .padding(.trailing, 10)
                        .foregroundStyle(.pink)
                        .buttonStyle(.plain)
                    }
                }
                .frame(width: 370, height: 40)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 10) {
                        
                    }
                }
            }
            .padding()
        }
    }
    
    func remove() {
        searchQuery = ""
    }
    
    func searchImages() {
        
    }
}

#Preview {
    ContentView()
}
