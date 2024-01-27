//
//  DetailView.swift
//  MovieDB
//
//  Created by Muhammad Fahmi on 09/01/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailView: View {
    
    let movie: Movie
    @ObservedObject var vm: DetailPresenter
    
    let offsetYContent: CGFloat = 50
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.background.ignoresSafeArea()
                ScrollView {
                    LazyVStack(spacing: 0) {
                        let backdropUrl = Constants.imgUrl+(vm.movie.backdropPath)
                        ZStack {
                            WebImage(url: URL(string: backdropUrl))
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .opacity(0.4)
                                .frame(height: 270)
                            if vm.movie.trailer.keyPath != "" {
                                Link(destination: URL(string: Constants.youtubeUrl+vm.movie.trailer.keyPath)!, label: {
                                    Image(systemName: "play.circle.fill")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .foregroundColor(.gray)
                                        .frame(width: 55, height: 55)
                                })
                            }
                        }
                        //Background Poster
                        HStack(alignment: .top) {
                            let imageUrl = Constants.imgUrl+(vm.movie.posterPath)
                            WebImage(url: URL(string: imageUrl))
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 152, height: 230)
                                .cornerRadius(10)
                            
                            VStack(alignment: .leading, spacing: 0) {
                                Text(vm.movie.title)
                                    .fontCustom(size: 24, fontWeight: .bold)
                                    .multilineTextAlignment(.leading)
                                    .lineLimit(3)
                                    .frame(height: 100, alignment: .trailing)
                                
                                VStack(spacing: 8) {
                                    
                                    HStack {
                                        Text("Adult")
                                            .fontCustom(size: 14)
                                        Spacer()
                                        Text(vm.movie.adult.description.uppercased())
                                            .fontCustom(size: 14, fontWeight: .bold, foregroundColor: .red)
                                            .lineLimit(1)
                                    }
                                    
                                    HStack {
                                        Text("Country")
                                            .fontCustom(size: 14)
                                        Spacer()
                                        Text(vm.movie.country)
                                            .fontCustom(size: 14)
                                            .lineLimit(1)
                                    }
                                    
                                    HStack {
                                        Text("PH")
                                            .fontCustom(size: 14)
                                            .foregroundColor(.black)
                                        Spacer()
                                        Text(vm.movie.productionHouse)
                                            .fontCustom(size: 14)
                                            .lineLimit(1)
                                    }
                                }
                                .padding(.top, 10)
                            }
                            .padding(.leading, 14)
                            .offset(y: 50)
                        }
                        .padding(.vertical, 15)
                        .padding(.horizontal, 20)
                        .offset(y: -offsetYContent)
                        
                        HStack {
                            
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.white, lineWidth: 1)
                                .opacity(0.25)
                                .overlay(
                                    VStack {
                                        Text("Rating")
                                            .fontCustom(size: 13)
                                            .opacity(0.4)
                                        Text(vm.movie.rating.description+"/10")
                                            .fontCustom(size: 17, fontWeight: .bold)
                                            .frame(width: 55, height: 23)
                                    }
                                )
                                .frame(width: 98, height: 68)
                            Spacer()
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.white, lineWidth: 1)
                                .opacity(0.25)
                                .overlay(
                                    VStack {
                                        Text("Duration")
                                            .fontCustom(size: 13)
                                            .opacity(0.4)
                                        Text(String(vm.movie.duration)+" min")
                                            .fontCustom(size: 16, fontWeight: .bold)
                                            .frame(width: 90, height: 21)
                                    }
                                )
                                .frame(width: 98, height: 68)
                            Spacer()
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.white, lineWidth: 1)
                                .opacity(0.25)
                                .overlay(
                                    VStack {
                                        Text("Release")
                                            .fontCustom(size: 13)
                                            .opacity(0.4)
                                        Text(vm.movie.releaseDate)
                                            .fontCustom(size: 16, fontWeight: .bold)
                                            .frame(width: 90, height: 21)
                                    }
                                )
                                .frame(width: 109, height: 68)
                            
                            
                        }
                        .padding(.horizontal, 20)
                        .padding(.top, -offsetYContent)
                        .padding(.bottom, 15)
                        
                        Text("Synopsis")
                            .fontCustom(size: 20, fontWeight: .semiBold)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 20)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text(vm.movie.description)
                            .fontCustom(size: 14)
                            .opacity(0.75)
                            .padding(.top, 10)
                            .padding(.horizontal, 20)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("Casts")
                            .fontCustom(size: 20, fontWeight: .semiBold)
                            .padding(.vertical, 20)
                            .padding(.horizontal, 20)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ScrollView(.horizontal) {
                            HStack (spacing: 18) {
                                ForEach(vm.movie.casts, id: \.id) { cast in
                                    VStack(alignment: .leading, spacing: 5) {
                                        let profileUrl = Constants.imgUrl+cast.profilePath
                                        WebImage(url: URL(string: profileUrl))
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 90, height: 100)
                                            .clipShape(
                                                Circle()
                                            )
                                        Text(cast.name)
                                            .fontCustom(size: 16)
                                            .lineLimit(1)
                                    }
                                    .frame(width: 90)
                                }
                            }
                        }
                        .padding(.horizontal, 20)
                    }
                    .padding(.bottom, 20)
                }
                .scrollIndicators(.hidden)
                .ignoresSafeArea(edges: .top)
            }
            .onAppear {
                vm.movieParam.movieID = movie.movieID.description
                vm.getMovieDetail()
            }
        }
        .navigationTitle(vm.movie.title)
        .toolbar(.hidden, for: .tabBar)
    }
    
}

#Preview {
    let assembler: Assembler = AppAssembler.shared
    let presenter: DetailPresenter = assembler.resolve()
    let moviee: Movie = Movie(movieID: 181808, title: "Star Wars: The Last Jedi", posterPath: "/kOVEVeg59E0wsnXmF9nrh6OmWII.jpg", backdropPath: "/epVMXf10WqFkONzKR8V76Ypj5Y3.jpg", releaseDate: "2017-12-13", description: "Rey develops her newly discovered abilities with the guidance of Luke Skywalker, who is unsettled by the strength of her powers. Meanwhile, the Resistance prepares to do battle with the First Order.", adult: false, duration: 152, casts: [MovieCast(name: "Mark Hamill", popularity: 50.846, nameCharacter: "Luke Skywalker / Dobbu Scay (voice)", departement: "Acting", profilePath: "/2ZulC2Ccq1yv3pemusks6Zlfy2s.jpg"), MovieCast( name: "Carrie Fisher", popularity: 18.606, nameCharacter: "General Leia Organa", departement: "Acting", profilePath: "/d60ZwPUoizvw1gdU6dXvKUOeoDK.jpg"), MovieCast(name: "Adam Driver", popularity: 16.766, nameCharacter: "Kylo Ren / Ben Solo", departement: "Acting", profilePath: "/mG2vwd6hJHTiCh8zIxPFND3ibAj.jpg"), MovieCast( name: "Daisy Ridley", popularity: 38.812, nameCharacter: "Rey", departement: "Acting", profilePath: "/iVboQmgPC3tYFjezBjrVECJRS8n.jpg"), MovieCast(name: "Oscar Isaac", popularity: 33.798, nameCharacter: "Poe Dameron", departement: "Acting", profilePath: "/dW5U5yrIIPmMjRThR9KT2xH6nTz.jpg"), MovieCast(name: "Andy Serkis", popularity: 25.852, nameCharacter: "Supreme Leader Snoke", departement: "Acting", profilePath: "/eNGqhebQ4cDssjVeNFrKtUvweV5.jpg")], rating: 8.142)
    return DetailView(movie: moviee, vm: presenter)
}
