//
//  QuestionView.swift
//  AlgoQuizTrivia
//
//  Created by macuser on 2023-11-21.
//

import Foundation
import SwiftUI

struct QuestionView : View {
    
    var question : ApiQuestion
    @ObservedObject var QVM : QuizViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            
            Text("Q.\(QVM.currentQuestionIndex + 1) : " + question.question)
                .foregroundColor(.black)
                .font(.headline).padding(.bottom,30)
            
            if(question.answers.answer_a != nil){
                
                Button(action: {
                    if(question.correct_answers.answer_a_correct == "true"){
                        QVM.quiz.grade += 1
                        print(QVM.quiz.grade)
                    }
                    QVM.QuestionAnswered = false
                }) {
                    Label (
                        title: { Text("A : \(question.answers.answer_a ?? "Error")") },
                        icon: { Image(systemName: "hand.tap.fill") }
                    )
                }.padding(.bottom,10).disabled(!QVM.QuestionAnswered)
            }
            
            if(question.answers.answer_b != nil){
                
                Button(action: {
                    if(question.correct_answers.answer_b_correct == "true"){
                        QVM.quiz.grade += 1
                        print(QVM.quiz.grade)
                    }
                    QVM.QuestionAnswered = false
                }) {
                    Label (
                        title: { Text("B : \(question.answers.answer_b ?? "Error")") },
                        icon: { Image(systemName: "hand.tap.fill") }
                    )
                }.padding(.bottom,10).disabled(!QVM.QuestionAnswered)
            }
            
            if(question.answers.answer_c != nil){
                
                Button(action: {
                    if(question.correct_answers.answer_c_correct == "true"){
                        QVM.quiz.grade += 1
                        print(QVM.quiz.grade)
                    }
                    QVM.QuestionAnswered = false
                }) {
                    Label (
                        title: { Text("C : \(question.answers.answer_c ?? "Error")") },
                        icon: { Image(systemName: "hand.tap.fill") }
                    )
                }.padding(.bottom,10).disabled(!QVM.QuestionAnswered)
            }
            
            if(question.answers.answer_d != nil){
                
                Button(action: {
                    if(question.correct_answers.answer_d_correct == "true"){
                        QVM.quiz.grade += 1
                        print(QVM.quiz.grade)
                    }
                    QVM.QuestionAnswered = false
                }) {
                    Label (
                        title: { Text("D : \(question.answers.answer_d ?? "Error")") },
                        icon: { Image(systemName: "hand.tap.fill") }
                    )
                }.padding(.bottom,10).disabled(!QVM.QuestionAnswered)
            }
            
            
            
            
            
            
        }
    }
}
