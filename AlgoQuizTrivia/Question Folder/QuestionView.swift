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
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .frame(width: 300, height: 200)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .shadow(radius: 3)
                
                Text("N. " + question.question)
                    .foregroundColor(.black)
                    .font(.headline)
            }.padding(.bottom,30)
            
            if(question.answers.answer_a != "null"){
                ZStack {
                    Rectangle()
                        .frame(width: 300, height: 50)
                        .foregroundColor(.white)
                        .padding(.vertical,5)
                        .cornerRadius(10)
                        .shadow(radius: 3)
                    
                    Button(question.answers.answer_a){
                        
                    }
                }
            }
            
            if(question.answers.answer_b != "null"){
                ZStack {
                    Rectangle()
                        .frame(width: 300, height: 50)
                        .foregroundColor(.white)
                        .padding(.vertical,5)
                        .cornerRadius(10)
                        .shadow(radius: 3)
                    
                    Button(question.answers.answer_b){
                        
                    }
                }
            }
            
            if(question.answers.answer_c != "null"){
                ZStack {
                    Rectangle()
                        .frame(width: 300, height: 50)
                        .foregroundColor(.white)
                        .padding(.vertical,5)
                        .cornerRadius(10)
                        .shadow(radius: 3)
                    
                    Button(question.answers.answer_c){
                        
                    }
                }
            }
            
            if(question.answers.answer_d != "null"){
                ZStack {
                    Rectangle()
                        .frame(width: 300, height: 50)
                        .foregroundColor(.white)
                        .padding(.vertical,5)
                        .cornerRadius(10)
                        .shadow(radius: 3)
                    
                    Button(question.answers.answer_d){
                        
                    }
                }
            }
            
        }
    }
}

