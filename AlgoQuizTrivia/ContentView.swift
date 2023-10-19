//
//  ContentView.swift
//  AlgoQuizTrivia
//
//  Created by macuser on 2023-10-18.
//

import SwiftUI

struct NavBar: View {
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
                        if isMenuVisible {
                            menuHeight = 100.0
                        } else {
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
                    .animation(.easeInOut(duration: 0.3))

                VStack(alignment: .leading, spacing: 10) {
                    Button("Take Quiz") {
                        // Add action for Button 1
                    }
                    Button("Quizzes Results") {
                        // Add action for Button 2
                    }
                }
                .foregroundColor(.white)
                .padding(.leading,20)
            }
        }
    }
}

struct ContentView: View {
    
    var body: some View {
        
        VStack{
            NavBar().zIndex(1)
        }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
