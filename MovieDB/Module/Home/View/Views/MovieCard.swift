//
//  MovieCard.swift
//  MovieDB
//
//  Created by Muhammad Fahmi on 04/01/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct MovieCard: View {
    
    let movie: Movie
    var imageHeight: CGFloat
    
    init(movie: Movie, imageHeight: CGFloat = 265) {
        self.movie = movie
        self.imageHeight = imageHeight
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .topTrailing) {
                WebImage(url: URL(string: Constants.imgUrl+movie.posterPath))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: imageHeight)
                    .cornerRadius(6)
                    .padding(.bottom, 12)
                Circle()
                    .fill(Color.background)
                    .overlay(
                        Text("\(movie.ranking)")
                            .fontCustom(size: 24, fontWeight: .extraBold, foregroundColor: Color.accentColor)
                    )
                    .frame(width: 40, height: 40)
                    .opacity(0.85)
                    .offset(x: -8, y: 8)
            }
            Text(movie.title)
                .fontCustom(size: 18)
                .multilineTextAlignment(.leading)
                .lineLimit(1)
        }
    }
    
}

#Preview {
    ZStack {
        Color.background
        MovieCard(movie: .init(ranking: 1, movieID: 123, title: "Star Wars : The Last", posterPath: "/ui4DrH1cKk2vkHshcUcGt2lKxCm.jpg"))
    }
    .ignoresSafeArea()
}
