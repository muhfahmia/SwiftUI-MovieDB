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
            WebImage(url: URL(string: Constants.imgUrl+movie.posterPath!))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: imageHeight)
                .cornerRadius(6)
                .padding(.bottom, 12)
            Text(movie.title ?? "Unknown Title")
                .fontCustom(size: 18)
                .multilineTextAlignment(.leading)
        }
    }
    
}

#Preview {
    ZStack {
        Color.background
        MovieCard(movie: .init(movieID: 123, title: "Star Wars : The Last", posterPath: "/ui4DrH1cKk2vkHshcUcGt2lKxCm.jpg"))
    }
    .ignoresSafeArea()
}
