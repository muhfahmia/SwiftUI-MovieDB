//
//  ContentView.swift
//  MovieDB
//
//  Created by Muhammad Fahmi on 20/12/23.
//

import SwiftUI
import Combine

struct HomeView: View {
    
    let router: HomeRouter
    @ObservedObject var vm: HomePresenter
    @State var currentIndex: Int = 0
    @GestureState var offset: CGFloat = 0
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.background
                    .ignoresSafeArea()
                VStack {
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
                    .padding(.top, 5)
                    .padding(.horizontal, 15)
                    
                    ScrollView {
                        HStack {
                            Text("Trending")
                                .fontCustom(size: 26, fontWeight: .extraBold)
                            Spacer()
                            
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
                        .padding(.top, 10)
                        .padding(.horizontal, 20)
                
                        GeometryReader { proxy in
                            let width = proxy.size.width * 0.38
                            let spacing: CGFloat = 25
                            HStack(spacing: spacing) {
                                ForEach(vm.movies, id: \.id) { movie in
                                    NavigationLink(destination: router.routeDetail(movie: movie)) {
                                        MovieCard(movie: movie, imageHeight: 235)
                                            .frame(width: width)
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                }
                            }
                            .padding(.horizontal, 20)
                            .offset(x: CGFloat(currentIndex) * -width + offset)
                            .highPriorityGesture(
                                DragGesture()
                                .updating($offset, body: { value, out, _ in
                                    out = value.translation.width
                                })
                               .onEnded { value in
                                   let offsetX = value.translation.width
                                   print("offsetX: \(offsetX)")
                                   let progress = -offsetX / width
                                   let roundIndex = progress.rounded()
                                   currentIndex = max(min(currentIndex + Int(roundIndex), vm.movies.count - 0), 0)
                                   print("currentIndex: \(currentIndex)")
                               }
                            )
                        }
                        .animation(.easeInOut, value: offset == 0)
                        .frame(height: 280)
                        
                        Spacer()
                    }
                }
                .onAppear {
                    vm.getMovieList()
                }
            }
        }
    }
}

#Preview {
    let assembler: Assembler = AppAssembler.shared
    let router: HomeRouter = assembler.resolve()
    let presenter: HomePresenter = assembler.resolve()
    return HomeView(router: router, vm: presenter)
}
