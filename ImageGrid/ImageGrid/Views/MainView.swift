//
//  ContentView.swift
//  ImageGrid
//
//  Created by Victoria Samsonova on 11.09.24.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    
    let columns = [GridItem(.adaptive(minimum: 150), spacing: 16)]
    
    var body: some View {
        NavigationStack {
         VStack(spacing: 0) {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .padding(.leading, 10)
                        .foregroundColor(.secondary)
                    TextField("Search", text: $viewModel.searchQuery)
                        .font(.title3)
                        .onChange(of: viewModel.searchQuery) {
                            viewModel.showAttentionalText = true
                        }
                    if viewModel.searchQuery != "" {
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
                .padding(.top, 20)
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 10) {
                        
                    }
                }
            }
            .padding()
        }
    }
    
    func remove() {
        viewModel.searchQuery = ""
    }
    
    func searchImages(queryWord: String) async {
        let apiKey = "p3toeuR3Aeo-lkkhfC8ctYIC5R05mQ5T3_zfp9szqBo"
        let urlQuery = "https://api.unsplash.com/search/photos?page=1&per_page=20&query=\(queryWord)&client_id=\(apiKey)"
        
        guard let url = URL(string: urlQuery) else { return }
        do {
            var request = URLRequest(url: url)
            let decoder = JSONDecoder()
            let (data, _) = try await URLSession.shared.data(for: request)
            if let decodedPhotos = try? decoder.decode([Result].self, from: data) {
                for photo in decodedPhotos {
                    
                }
            }
        }
        catch {
            
        }
        
        
    }
}

#Preview {
    MainView()
}
