//
//  ContentView.swift
//  AlgoQuizTrivia
//
//  Created by macuser on 2023-10-18.
//

import SwiftUI


struct ContentView: View {
    
    @State var page = "quizpage"
    
    @State var isQuizStarted : Bool = false
    
    @ObservedObject var QVM : QuizViewModel = QuizViewModel()
    @ObservedObject var QRVM : QuizResultViewModel = QuizResultViewModel()
    
    var body: some View {
        
        ZStack(alignment: .center){
//            LinearGradient(gradient: Gradient(colors: [Color.purple,Color.white]), startPoint: .top, endPoint: .center).zIndex(0)
            
            VStack(alignment: .center,spacing: 0){
                NavBar(page : $page , isQuizStarted: $isQuizStarted, QVM : QVM)
                if page == "quizpage"{
                    QuizPage(page: $page)
                }else if page == "quizsettings"{
                    QuizSettingsPage(page: $page,isQuizStarted: $isQuizStarted, QVM: QVM)
                } else if page == "startquiz" {
                    QuizStart(QVM: QVM, isQuizStarted: $isQuizStarted,page: $page, timePicked: QVM.quiz.Timer)
                } else if page == "savequizpage"{
                    SaveQuizResults(quiz: QVM.quiz, page: $page,QRVM: QRVM)
                } else if page == "resultpage" {
                    ResultsPage(QRVM: QRVM)
                }
            }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading).zIndex(1)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
