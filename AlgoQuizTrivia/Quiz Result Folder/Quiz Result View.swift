//
//  Quiz Result View.swift
//  AlgoQuizTrivia
//
//  Created by macuser on 2023-11-21.
//

import Foundation
import SwiftUI

struct QuizResultView : View {
    
    var quizResult : QuizResultModel
    @ObservedObject var QRVM : QuizResultViewModel
    
    var body: some View {
        VStack (alignment: .leading, spacing: 0) {
            
            HStack(spacing: 0){
                Spacer()
                Button(action: {
                    QRVM.deleteQuizResult(id: quizResult.id)
                }, label: {
                    Text("X").fontWeight(.black)
                }).padding(.horizontal,14).padding(.vertical,10).background(.blue).foregroundColor(.white).cornerRadius(50)
        
            }.padding(.trailing,10)
            
            HStack {
                Text(quizResult.quizName).fontWeight(.black).foregroundColor(.blue)
                Spacer()
                Text("\(quizResult.gradeInPercentage)%").font(.system(size: 40)).fontWeight(.black).padding(.trailing,20)
            }.padding(.horizontal)
            
            VStack(alignment: .leading, spacing: 0){
                Text("Grade : \(quizResult.gradeOutOfTotalNumberOfQuestion)")
                Text("Topic : \(quizResult.topic)")
                Text("Difficulty : \(quizResult.difficulty)")
                Text("Time Left : \(quizResult.TimeLeft)")
            }.padding(.horizontal).padding(.bottom)
            
            Text("Date&Time : \(quizResult.dateAndTime)").padding(.horizontal).opacity(50)

        }.frame(width: 300,height: 240).background(.white).shadow(radius: 1).padding(.bottom,20)
    }
}
