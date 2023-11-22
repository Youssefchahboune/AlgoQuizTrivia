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
    
    //@State var timeRemaining : Int // Set your initial time in seconds
    
    @State var timer: Timer? = nil
    
    var timePicked : Int = 0
    @State var displayTime : String = ""
    @State var ActualDisplayTime : String = ""
    
    
    var body: some View {
        
        if !QVM.AllQuestion.isEmpty{
            
        // Timer
            VStack(alignment: .leading,spacing: 0) {
                HStack {
                    Text("Timer ⏳ : \(/*timeRemaining*/ ActualDisplayTime)")
                        .font(.title3)
                        .onAppear {
                            // Start the timer when the view appears
                            
                            ActualDisplayTime = "Loading..."
                            
                            var t = 60 * timePicked
                            
                            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                                /*if timeRemaining > 0 {
                                    timeRemaining -= 1
                                } else {
                                    timer?.invalidate()
                                    isQuizStarted = false
                                    QVM.AllQuestion = []
                                    QVM.currentQuestionIndex = 0
                                    QVM.QuestionAnswered = true
                                    page = "savequizpage"
                                }*/
                                
                                QVM.timer = timer
                                
                                if displayTime != "00:00" {
                                    
                                    var min : Int
                                    var s : Int
                                    
                                    if(t < 60 ){
                                        if(t < 10){
                                            displayTime = "00:0\(String(t))"
                                        } else {
                                            displayTime = "00:\(String(t))"
                                        }
                                    } else {
                                        displayTime = ""
                                        min = t/60
                                        s = t - (60 * min)
                                        
                                        if(min < 10){
                                            displayTime += "0\(String(min))"
                                        } else {
                                            displayTime += "\(String(min))"
                                        }
                                        
                                        displayTime += ":"
                                        
                                        if(s < 10){
                                            displayTime += "0\(String(s))"
                                        } else {
                                            displayTime += "\(String(s))"
                                        }
                                    }
                                    
                                    t -= 1
                                    ActualDisplayTime = displayTime
                                    print(ActualDisplayTime)
                                    QVM.quiz.timerString = ActualDisplayTime
                                    
                                } else {
                                    QVM.quiz.timerString = ActualDisplayTime
                                    timer?.invalidate()
                                    displayTime = ""
                                    ActualDisplayTime = ""
                                    isQuizStarted = false
                                    QVM.AllQuestion = []
                                    QVM.currentQuestionIndex = 0
                                    QVM.QuestionAnswered = true
                                    page = "savequizpage"
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
                        QVM.QuestionAnswered = true
                        timer?.invalidate()
                        page = "savequizpage"// go to save quiz page
                    }.frame(width: 150, height: 50)
                        .background(QVM.QuestionAnswered ? Color.gray : Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(50)
                        .fontWeight(.black)
                        .padding(.vertical,30)
                        .shadow(radius: 5)
                        .disabled(QVM.QuestionAnswered)
                    
                } else {
                    Button("Next"){
                        QVM.Next()
                        QVM.QuestionAnswered = true
                    }.frame(width: 150, height: 50)
                        .background(QVM.QuestionAnswered ? Color.gray : Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(50)
                        .fontWeight(.black)
                        .padding(.vertical,30)
                        .shadow(radius: 5)
                        .disabled(QVM.QuestionAnswered)
                }
                
            }.padding(.top, 30).padding(.horizontal, 10)
        } else {
            Text("Loading Questions... ").padding(.top, 30)
        }
    }
}

