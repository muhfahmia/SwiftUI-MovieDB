//
//  OnBoard.swift
//  MovieDB
//
//  Created by Muhammad Fahmi on 20/12/23.
//

import SwiftUI

struct OnBoard: View {
    private let mvBG: [String] = ["OnBoard_BG", "OnBoard_BG2", "OnBoard_BG3"]
    private let timer = Timer.publish(every: 2.0, on: .main, in: .common).autoconnect()
    @State private var mvBGSelected: Int = 0
    
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
                .ignoresSafeArea()
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
                    NavigationLink(destination: HomeView(), label: {
                        Text("Get Started")
                            .frame(height: 50)
                            .padding(.horizontal, 50)
                            .background(Color.gray)
                            .cornerRadius(25)
                            .tint(.white)
                            .fontWeight(.medium)
                    })
                }.safeAreaPadding(35)
            }.background(content: {
                TabView(selection: $mvBGSelected) {
                    ForEach(0..<mvBG.count, id: \.self) { index in
                        ZStack(alignment: .topLeading) {
                            Image("\(mvBG[index])")
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

#Preview {
    OnBoard()
}
