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
    
    var body: some View {
        VStack (alignment: .leading, spacing: 0) {
            
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
            
            Text("Date&Time : \(quizResult.dateAndTime.formatted())").padding(.horizontal).opacity(50)

        }.frame(width: 300,height: 200).background(.white).shadow(radius: 1).padding(.bottom,20)
    }
}
