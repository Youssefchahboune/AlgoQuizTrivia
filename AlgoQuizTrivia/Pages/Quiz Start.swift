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
            
            VStack(alignment: .center, spacing: 0) {
                VStack {
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
                }.padding(.bottom).padding(.top,10).padding(.bottom,10)
                
                QuestionView(question: QVM.AllQuestion[QVM.currentQuestionIndex])
                
                if QVM.currentQuestionIndex+1 == QVM.AllQuestion.count{
                    
                    Button("Finish"){
                        // compute quize grade and set the quiz grade
                        isQuizStarted = false
                        page = "savequizpage"// go to save quiz page
                    }.frame(width: 150, height: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(50)
                        .fontWeight(.black)
                        .padding(.vertical,30)
                        .animation(Animation.easeOut(duration: 0.5).delay(0.15))
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
                        .animation(Animation.easeOut(duration: 0.5).delay(0.15))
                        .shadow(radius: 5)
                }
                
            }.padding(.top, 30)
        } else {
            Text("Loading Questions... ")
        }
    }
}

