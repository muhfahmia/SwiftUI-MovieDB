//
//  ContentView.swift
//  MovieDB
//
//  Created by Muhammad Fahmi on 20/12/23.
//

import SwiftUI
import Combine

struct HomeView: View {
    
    @ObservedObject var vm: HomePresenter
    @State var tabSelected: Int = 0
    @State var cardGeoHeight: CGFloat = 0
    
    let router: HomeRouter
    private let PHContent: EdgeInsets = .init(top: 0, leading: 15, bottom: 0, trailing: 15)
    private let tabView: [String] = ["Now Playing", "Popular", "Top Rated", "Up Coming"]
    private let movieTypeGrid = [
        GridItem(.fixed(200)),
        GridItem(.fixed(200))
    ]

    var seeAllBtn: some View {
        NavigationLink(destination: router.routeUser) {
            HStack {
                Text("Lihat semua")
                    .fontCustom(size: 14)
                Image(systemName: "chevron.right")
                    .foregroundColor(.white)
                    .font(.headline)
                    .imageScale(.small)
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.background.ignoresSafeArea()
                VStack {
                    //Header Home Section
                    HStack {
                        Text("Watching")
                            .foregroundStyle(Color.accentColor)
                            .font(.title)
                            .bold()
                        Text("me")
                            .foregroundColor(.white)
                            .font(.title2)
                            .bold()
                            .offset(x: -8, y: 3)
                        Spacer()
                        Button(action: {
                            print("navigate to search")
                        }, label: {
                            Image(systemName: "magnifyingglass")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(Color.white)
                                .frame(width: 30)
                        })
                    }
                    .padding(PHContent)
                    
                    ScrollView {
                        LazyVStack {
                            //MovieTrending Section
                            HStack {
                                Text("Top 10 Trending")
                                    .fontCustom(size: 26, fontWeight: .extraBold)
                                Spacer()
                            }
                            .padding(PHContent)
                            
                            GeometryReader { proxy in
                                let width = proxy.size.width * 0.42
                                let height = width * 1.5
                                let spacing: CGFloat = 25
                                ScrollView(.horizontal) {
                                    LazyHStack(spacing: spacing) {
                                        ForEach(vm.movies, id: \.id) { movie in
                                            NavigationLink(destination: router.routeDetail(movie: movie)) {
                                                MovieCard(movie: movie, imageHeight: height)
                                                    .frame(width: width)
                                            }
                                            .buttonStyle(PlainButtonStyle())
                                        }
                                    }
                                }
                                .onAppear {
                                    cardGeoHeight = height + 50
                                }
                            }
                            .frame(height: cardGeoHeight)
                            .padding(PHContent)
                            
                            //MovieType Section
                            ScrollView(.horizontal) {
                                HStack(spacing: 25) {
                                    ForEach(Array(tabView.enumerated()), id: \.element) { (index, tab) in
                                        LazyVStack {
                                            Text("\(tab)")
                                                .fontCustom(size: 18, fontWeight: .bold)
//                                                .padding(.horizontal, 10)
                                            Rectangle()
                                                .fill(tabSelected == index ? Color.accentColor : Color.clear)
//                                                .padding(.horizontal, 10)
                                                .frame(height: 3)
                                                .cornerRadius(25)
                                        }
                                        .onTapGesture {
                                            tabSelected = index
                                        }
                                    }
                                }
                            }
                            .padding(PHContent)
                            .padding(.top, 20)
                            
                            //                            LazyVGrid(columns: movieTypeGrid, spacing: 20) {
                            //                                ForEach(vm.movieNowPlaying.value ?? [Movie](), id: \.id) { movie in
                            //                                    Text("\(movie.title)")
                            //                                       .frame(width: 150, height: 150, alignment: .center)
                            //                                       .background(.blue)
                            //                                       .cornerRadius(10)
                            //                                       .foregroundColor(.white)
                            //                                       .font(.title)
                            //                               }
                            //                           }
                            
                            
                        }
                        
                    }
                    .scrollIndicators(.hidden)
                    .onAppear {
                        vm.getMovieList()
                        vm.getMovieListNowPlaying()
                    }
                }
            }
        }
    }
}

#Preview {
    let assembler: Assembler = AppAssembler.shared
    let router: HomeRouter = assembler.resolve()
    let presenter: HomePresenter = assembler.resolve()
    return HomeView(vm: presenter, router: router)
}
