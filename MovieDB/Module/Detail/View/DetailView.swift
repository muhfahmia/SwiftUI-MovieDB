//
//  DetailView.swift
//  MovieDB
//
//  Created by Muhammad Fahmi on 09/01/24.
//

import SwiftUI

struct DetailView: View {
    
    let movie: Movie
    @ObservedObject var vm: DetailPresenter
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.background.ignoresSafeArea()
            }
            .onAppear {
                vm.movieParam.movieID = movie.movieID?.description ?? ""
                vm.getMovieDetail()
            }
        }
        .toolbar(.hidden, for: .tabBar)
    }
}

#Preview {
    let assembler: Assembler = AppAssembler.shared
    let presenter: DetailPresenter = assembler.resolve()
    let moviee: Movie = .init(movieID: 906126, title: Optional("Society of the Snow"), posterPath: Optional("/k7rEpZfNPB35FFHB00ZhXHKTL7X.jpg"), backdropPath: Optional("/vdpE5pjJVql5aD6pnzRqlFmgxXf.jpg"), releaseDate: Optional("2023-12-13"))
    return DetailView(movie: moviee, vm: presenter)
}
