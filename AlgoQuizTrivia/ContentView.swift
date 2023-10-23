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
                        .animation(.easeInOut(duration: 0.4))
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
        
        ZStack(alignment: .center){
            LinearGradient(gradient: Gradient(colors: [Color.blue,Color.white]), startPoint: .top, endPoint: .center).zIndex(0)
            
            VStack(alignment: .leading,spacing: 0){
                NavBar(page : $page)
                if page == "quizpage"{
                    QuizPage(page: $page)
                } else if page == "resultpage" {
                    ResultsPage()
                }
            }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading).zIndex(1)
        }
    }
}

struct QuizPage: View {
    @State private var isTextVisible = false
    @Binding var page : String
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            if isTextVisible {
                Image("top icon")
                    .resizable()
                    .frame(width: 200,height: 200)
                    .padding(.vertical, 20)
                    .animation(Animation.easeOut(duration: 0.5))
                
                Text("AlgoQuiz App")
                    .padding(.horizontal)
                    .foregroundColor(.blue)
                    .fontWeight(.black)
                    .font(.system(size: 40))
                    .multilineTextAlignment(.center)
                    .animation(Animation.easeOut(duration: 0.5).delay(0.05))
                
                Text("AlgoQuiz is your gateway to testing your knowledge across a wide range of technologies and topics.")
                    .padding(.vertical)
                    .padding(.horizontal)
                    .multilineTextAlignment(.center)
                    .animation(Animation.easeOut(duration: 0.5).delay(0.1))
            
                VStack {
                    Button("Ready") {}.frame(width: 150, height: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(50)
                        .fontWeight(.black)
                        .padding(.vertical,30)
                        .animation(Animation.easeOut(duration: 0.5).delay(0.15))
                        .shadow(radius: 5)
                }
            }
        }
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
