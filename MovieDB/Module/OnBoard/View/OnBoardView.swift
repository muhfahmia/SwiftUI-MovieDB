//
//  OnBoard.swift
//  MovieDB
//
//  Created by Muhammad Fahmi on 20/12/23.
//

import SwiftUI

struct OnBoardView: View {
    private let router: OnBoardRouter
    private let mvBG: [String] = ["OnBoard_BG", "OnBoard_BG2", "OnBoard_BG3"]
    private let timer = Timer.publish(every: 2.0, on: .main, in: .common).autoconnect()
    @State private var mvBGSelected: Int = 0
    
    init(router: OnBoardRouter) {
        self.router = router
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(
                    colors: [
                        Color.background.opacity(0.7)
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
                VStack {
                    Spacer()
                    Text("Watch your Favorite Movie")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                        .padding()
                    Text("Download and Watch offline where you are")
                        .padding(.bottom, 20)
                        .foregroundColor(.white)
                        .font(.headline)
                        .fontWeight(.medium)
                        .fontWeight(.regular)
                        .multilineTextAlignment(.center)
                    NavigationLink(destination: router.homeView, label: {
                        Text("Get Started")
                            .frame(height: 50)
                            .padding(.horizontal, 50)
                            .background(Color.gray)
                            .cornerRadius(25)
                            .tint(.white)
                            .fontWeight(.medium)
                    })
                }
                .padding(.bottom, 40)
            }
            .ignoresSafeArea()
            .background(content: {
                TabView(selection: $mvBGSelected) {
                    ForEach(0..<mvBG.count, id: \.self) { index in
                        ZStack(alignment: .top) {
                            Image("\(mvBG[index])")
                                .resizable()
                        }
                    }
                }
            })
            .onReceive(timer) { _ in
                withAnimation(.bouncy) {
                    mvBGSelected = (mvBGSelected + 1) % mvBG.count
                }
            }
        }
    }
}

//#Preview {
//    OnBoard()
//}
