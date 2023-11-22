//
//  QuizViewModel.swift
//  AlgoQuizTrivia
//
//  Created by macuser on 2023-11-21.
//

import Foundation
import SwiftUI

// api to use -> Quizapi.io
// basic api call -> https://quizapi.io/api/v1/questions?apiKey=99mUnElLvURJWSmEVzKMxbg15LILCH8ytt4Q9IUa

// basic api call with topic & difficulty -> https://quizapi.io/api/v1/questions?apiKey=99mUnElLvURJWSmEVzKMxbg15LILCH8ytt4Q9IUa&difficulty=easy&limit=10&tags=python

class QuizViewModel : ObservableObject {

    @Published var quiz: Quiz
    @Published var currentQuestionIndex: Int = 0

        init() {
            quiz = Quiz(quizName: "Sample Quiz",questions: [
                Question(questionNum: 1, questionText: "What is Java", answer: "A Programming Language", options: ["A Cake", "A Programming Language", "A pet name"]),
                Question(questionNum: 2, questionText: "Is a String an object ?", answer: "True", options: ["True", "False"])
            ], topic: "Java", difficulty: "easy")
        }
    
    func Next() {
        if currentQuestionIndex+1 < quiz.questions.count {
            currentQuestionIndex += 1
        }
    }
    
}
