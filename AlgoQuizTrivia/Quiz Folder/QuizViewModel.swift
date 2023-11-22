//
//  QuizViewModel.swift
//  AlgoQuizTrivia
//
//  Created by macuser on 2023-11-21.
//

import Foundation
import SwiftUI


class QuizViewModel : ObservableObject {

    @Published var quiz: Quiz = Quiz()
    @Published var currentQuestionIndex: Int = 0
    @Published var AllQuestion : [ApiQuestion] = []


    
    func Next() {
        if currentQuestionIndex+1 < AllQuestion.count {
            currentQuestionIndex += 1
        }
    }
    
    func getQuiz() {
            // Define the URL for the API
            guard let url = URL(string: "https://quizapi.io/api/v1/questions?apiKey=99mUnElLvURJWSmEVzKMxbg15LILCH8ytt4Q9IUa&difficulty=easy&limit=10&tags=linux") else {
                // Handle URL creation error
                return
            }
            
            // Create a URLSession data task to fetch data from the API
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    // Handle network error
                    print("Error: \(error.localizedDescription)")
                } else if let data = data {
                    do {
                        // Parse the JSON data into an array of Hero objects
                        let decoder = JSONDecoder()
                        let questions = try decoder.decode([ApiQuestion].self, from: data)
                        
                        // Update the @Published property on the main thread
                        DispatchQueue.main.async {
                            self.AllQuestion = Array(questions)
                        }
                    } catch {
                        // Handle JSON decoding error
                        print("JSON decoding error: \(error)")
                    }
                }
            }.resume()
        }
    
}
