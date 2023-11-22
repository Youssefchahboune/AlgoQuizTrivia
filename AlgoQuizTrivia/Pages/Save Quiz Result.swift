//
//  Save Quiz Result.swift
//  AlgoQuizTrivia
//
//  Created by macuser on 2023-11-21.
//

import Foundation
import SwiftUI

struct SaveQuizResults : View {
    
    var quiz : Quiz
    
    @Binding var page : String
    
    @State var quizName : String = ""
    
    @ObservedObject var QRVM : QuizResultViewModel
    
    
    var body: some View {
        
        VStack(alignment: .center) {
            Text("Save Quiz Results ?").fontWeight(.black).font(.system(size: 35)).multilineTextAlignment(.center).padding(.top,50).foregroundColor(.blue).animation(Animation.easeOut(duration: 0.5).delay(0)).padding(.bottom,20)
            
            
            HStack {
                TextField("Enter Quiz Name", text: $quizName).frame(width: 200).background(.white).shadow(radius: 1).multilineTextAlignment(.center)
            }.padding(.bottom,10)
            
            Text("\(Int((quiz.grade * 100 ) / quiz.numOfQuestion))%").fontWeight(.black).padding(.top).font(.system(size: 50)).padding(.bottom,20)
            
            HStack {
                Text("Topic :")
                Text("\(quiz.topic)")
            }
            HStack {
                Text("Difficulty :")
                Text("\(quiz.difficulty)")
            }
            HStack {
                Text("Number Of Questions :")
                Text("\(quiz.numOfQuestion)")
            }
            HStack {
                Text("Date & Time :")
                Text("\(quiz.DateAndTime.formatted())")
            }
            
            
            HStack {
                Button("Save Quiz 💾") {
                    var updatedQuiz = quiz // Make a mutable copy of the quiz
                    updatedQuiz.quizName = quizName // Update the quizName property
                    
                    QRVM.SaveQuizResult(quiz: updatedQuiz)
                    print(QRVM.listOfResults.count)
                    page = "quizpage"
                }.frame(width: 150, height: 50)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(50)
                    .fontWeight(.black)
                    .padding(.vertical,30)
                    .animation(Animation.easeOut(duration: 0.5).delay(0.15))
                    .shadow(radius: 1)
                
                Button("Don't Save ❌"){
                    page = "quizpage"
                }.frame(width: 150, height: 50)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(50)
                    .fontWeight(.black)
                    .padding(.vertical,30)
                    .animation(Animation.easeOut(duration: 0.5).delay(0.15))
                    .shadow(radius: 1)
            }
        }.padding(.top,20)
    }
}
