//
//  Quiz Start.swift
//  AlgoQuizTrivia
//
//  Created by macuser on 2023-11-21.
//

import Foundation
import SwiftUI

struct QuizStart : View {
    
    @ObservedObject var QVM : QuizViewModel
    @Binding var isQuizStarted : Bool
    @Binding var page : String
    
    @State private var timeRemaining = 10 // Set your initial time in seconds
    @State private var timer: Timer? = nil
    
    
    var body: some View {
        
        if !QVM.AllQuestion.isEmpty{
            
        // Timer
            VStack(alignment: .leading,spacing: 0) {
                HStack {
                    Text("Timer ⏳ : \(timeRemaining)")
                        .font(.title3)
                        .onAppear {
                            // Start the timer when the view appears
                            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                                if timeRemaining > 0 {
                                    timeRemaining -= 1
                                } else {
                                    timer?.invalidate()
                                    //page = "savequizpage"
                                }
                            }
                        }
                    
                    Spacer()
                    
                    Text("Topic : \(QVM.quiz.topic)").font(.title3)
                }.padding(.top,10).padding(.bottom,10)
                
                Text("Score: \(QVM.quiz.grade)/\(QVM.AllQuestion.count)").font(.title3).padding(.bottom,30)
                
        // Question View
                QuestionView(question: QVM.AllQuestion[QVM.currentQuestionIndex], QVM : QVM)
            
        // buttons Finish, Previous & Next
                if QVM.currentQuestionIndex+1 == QVM.AllQuestion.count{
                    
                    Button("Finish"){
                        // compute quize grade and set the quiz grade
                        isQuizStarted = false
                        QVM.AllQuestion = []
                        QVM.currentQuestionIndex = 0
                        page = "savequizpage"// go to save quiz page
                    }.frame(width: 150, height: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(50)
                        .fontWeight(.black)
                        .padding(.vertical,30)
                        .shadow(radius: 5)
                    
                } else {
                    Button("Next"){
                        QVM.Next()
                    }.frame(width: 150, height: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(50)
                        .fontWeight(.black)
                        .padding(.vertical,30)
                        .shadow(radius: 5)
                    
                }
                
            }.padding(.top, 30).padding(.horizontal, 10)
        } else {
            Text("Loading Questions... ").padding(.top, 30)
        }
    }
}

