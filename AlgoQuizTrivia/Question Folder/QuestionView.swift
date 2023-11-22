//
//  QuestionView.swift
//  AlgoQuizTrivia
//
//  Created by macuser on 2023-11-21.
//

import Foundation
import SwiftUI

struct QuestionView : View {
    
    var question : Question
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .frame(width: 300, height: 200)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .shadow(radius: 3)

                Text("\(question.questionNum). " + question.questionText)
                    .foregroundColor(.black)
                    .font(.headline)
            }.padding(.bottom,30)
            
            ForEach(question.options, id: \.self) { option in
                
                ZStack {
                    Rectangle()
                        .frame(width: 300, height: 50)
                        .foregroundColor(.white)
                        .padding(.vertical,5)
                        .cornerRadius(10)
                        .shadow(radius: 3)
                    
                    Button(option){
                        
                    }

                    
                }
            }
        }
    }
}
