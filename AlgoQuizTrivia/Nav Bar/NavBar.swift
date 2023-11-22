//
//  NavBar.swift
//  AlgoQuizTrivia
//
//  Created by macuser on 2023-11-21.
//

import Foundation
import SwiftUI

struct NavBar: View {
    @Binding var page: String
    @Binding var isQuizStarted : Bool
    @State private var isMenuVisible = false
    @State private var menuHeight: CGFloat = 0.0

    var body: some View {
        VStack(alignment: .leading,spacing: 0) {
            HStack {
                Text("AlgoQuiz").foregroundColor(.white).padding(.leading, 20).fontWeight(.black)
                Spacer()
                Button(action: {
                        withAnimation {
                            isMenuVisible.toggle()
                            if isMenuVisible && isQuizStarted {
                                menuHeight = 65.0
                            } else if isMenuVisible {
                                menuHeight = 100.0
                            }
                            else {
                                menuHeight = 0.0
                            }
                        }
                    }) {
                        Image("HamburgerIcon").resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.blue)
                            .padding(.trailing, 20)
                    }
            }.frame(height: 70).background(Color.blue)
                ZStack(alignment: .leading) {
                    Rectangle()
                        .frame(height: menuHeight)
                        .foregroundColor(.blue)
                        .animation(.easeInOut(duration: 0.4))
                    if isMenuVisible {
                        VStack(alignment: .leading, spacing: 10) {
                            
                            if !isQuizStarted {
                                Button("Quiz") {
                                    page = "quizpage"
                                    isMenuVisible = false
                                    menuHeight = 0.0
                                }.fontWeight(.heavy)
                                    .disabled(!isMenuVisible)
                                Button("Results") {
                                    page = "resultpage"
                                    isMenuVisible = false
                                    menuHeight = 0.0
                                }.fontWeight(.heavy)
                                .disabled(!isMenuVisible)
                            } else {
                                Button("Quit") {
                                    page = "quizpage"
                                    isQuizStarted = false
                                    isMenuVisible = false
                                    menuHeight = 0.0
                                }.fontWeight(.heavy)
                                .disabled(!isMenuVisible)
                            }
                        }.foregroundColor(.white)
                            .padding(.leading,20)
                            .opacity(isMenuVisible ? 1.0 : 0.0)
                    }
                }
        }
    }
}
