//
//  ContentView.swift
//  AlgoQuizTrivia
//
//  Created by macuser on 2023-10-18.
//

import SwiftUI

struct NavBar: View {
    @Binding var page: String
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
                    if isMenuVisible {
                        VStack(alignment: .leading, spacing: 10) {
                            Button("Quiz") {
                                page = "quizpage"
                            }
                            Button("Results") {
                                page = "resultpage"
                            }
                        }.foregroundColor(.white)
                            .padding(.leading,20)
                            .opacity(isMenuVisible ? 1.0 : 0.0)
                            .disabled(!isMenuVisible)
                    }
                }
        }
    }
}

struct ContentView: View {
    
    @State var page = "quizpage"
    
    var body: some View {
        
        VStack(alignment: .leading,spacing: 0){
                NavBar(page : $page)
                if page == "quizpage"{
                    QuizPage(page: $page)
                } else if page == "resultpage" {
                    ResultsPage()
                }
                
        }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
}

struct QuizPage: View {
    @State private var isTextVisible = false
    @Binding var page : String
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            if isTextVisible {
                Text("Welcome to AlgoQuiz 👨‍💻")
                    .fontWeight(.black)
                    .font(.system(size: 40))
                    .foregroundColor(.blue)
                    .padding(.vertical, 20)
                    .offset(x: 0) // Start from the left edge
                    .animation(Animation.easeOut(duration: 0.5))
                
                Text("AlgoQuiz is your gateway to testing your knowledge across a wide range of technologies and topics.")
                    .padding(.trailing, 50)
                    .padding(.vertical)
                    .offset(x: 0) // Start from the left edge
                    .animation(Animation.easeOut(duration: 0.5).delay(0.1))
                
                Text("Are you ready to challenge yourself and prove your expertise?")
                    .padding(.trailing, 50)
                    .padding(.vertical)
                    .offset(x: 0) // Start from the left edge
                    .animation(Animation.easeOut(duration: 0.5).delay(0.2))
                
                Text("Click the Ready button to embark on your AlgoQuiz journey and demonstrate your tech-savvy prowess or click the show Results to see all results from previous quiz!")
                    .padding(.trailing, 30)
                    .padding(.vertical)
                    .offset(x: 0) // Start from the left edge
                    .animation(Animation.easeOut(duration: 0.5).delay(0.3))
                
                HStack {
                    Button("Ready") {}.frame(width: 100, height: 40)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(50)
                        .fontWeight(.black)
                        .padding(.trailing, 25)
                        .padding(.vertical)
                        .offset(x: 0) // Start from the left edge
                        .animation(Animation.easeOut(duration: 0.5).delay(0.3))
                    
                    
                    
                    Button("Show Results") {
                        page = "resultpage"
                    }.frame(width: 200, height: 40)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(50)
                        .fontWeight(.black)
                        .padding(.vertical)
                        .offset(x: 0) // Start from the left edge
                        .animation(Animation.easeOut(duration: 0.5).delay(0.3))
                    
                }
            }
        }
        .padding(.leading, 20)
        .padding(.top,50)
        .onAppear {
            withAnimation {
                isTextVisible = true
            }
        }
    }
}


struct ResultsPage : View {
    var body: some View {
        
        VStack {
            Text("Result page").fontWeight(.black).font(.system(size: 40))
        }.padding(.leading,20)
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
