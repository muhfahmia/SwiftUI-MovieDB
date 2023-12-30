//
//  ContentView.swift
//  MovieDB
//
//  Created by Muhammad Fahmi on 20/12/23.
//

import SwiftUI

struct HomeView: View {
    
    private let items: [String] = ["All", "Movies", "TV Shows", "Web Series", "Sports"]
    @State var movie: String = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(
                    colors: [
                        Color.background.opacity(0.95)
                    ],
                    startPoint: .leading,
                    endPoint: .trailing
                )
                .ignoresSafeArea()
                
                ScrollView {
                    VStack {
                        HStack {
                            Image(systemName: "magnifyingglass")
                            TextField("Search", text: $movie)
                        }
                        .padding()
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 15.0, style: .continuous))
                    }
                    .padding(.horizontal, 30)
                    .padding(.top, 15)
                    
                    VStack {
                        GeometryReader { geometry in
                            ScrollView(.horizontal) {
                                HStack {
                                    ForEach(items, id: \.self) { item in
                                        Text(item)
                                            .padding()
                                            .background(Color.accentColor.opacity(0.2))
                                            .foregroundStyle(.white)
                                            .bold()
                                            .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
                                    }
                                }
                            }
                            .scrollIndicators(.hidden)
                        }
                        .frame(height: 55, alignment: .leading)
                    }
                    .padding()
                    
                    VStack {
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(items, id: \.self) { item in
                                    
                                }
                            }
                        }
                        .scrollIndicators(.hidden)
                    }
                    
                    Spacer()
                }
                
            }
        }
        .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    HomeView()
    
}
