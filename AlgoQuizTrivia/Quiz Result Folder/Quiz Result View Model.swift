//
//  Quiz Result View Model.swift
//  AlgoQuizTrivia
//
//  Created by macuser on 2023-11-21.
//

import Foundation
import SwiftUI

class QuizResultViewModel : ObservableObject {
    @Published var listOfResults : [QuizResultModel] = [QuizResultModel(quizName: "Test 1", topic: "Java", gradeInPercentage: 100, gradeOutOfTotalNumberOfQuestion: "10/10", totalNumberOfQuestion: 10, difficulty: "Hard", dateAndTime: Date()),QuizResultModel(quizName: "Test 2", topic: "HTML", gradeInPercentage: 90, gradeOutOfTotalNumberOfQuestion: "18/20", totalNumberOfQuestion: 20, difficulty: "Medium", dateAndTime: Date())]
    
    
    func SaveQuizResult(quiz:Quiz){
        
        let newQuizSaved = QuizResultModel(quizName: quiz.quizName,topic: quiz.topic, gradeInPercentage: quiz.grade, gradeOutOfTotalNumberOfQuestion: "\(0)/\(quiz.numOfQuestion)", totalNumberOfQuestion: quiz.numOfQuestion, difficulty: quiz.difficulty, dateAndTime: quiz.DateAndTime)
        
        listOfResults.append(newQuizSaved)
    }
}
