//
//  Quiz Setting Page.swift
//  AlgoQuizTrivia
//
//  Created by macuser on 2023-11-21.
//

import Foundation
import SwiftUI

struct QuizSettingsPage : View {
    @Binding var page : String
    @Binding var isQuizStarted : Bool
    @ObservedObject var QVM : QuizViewModel
    
    @State private var selectedTopic = 0
        let topicOptions = ["HTML", "JavaScript","Linux"]
    
    @State private var selectedNumberOfQuestion = 0
        let numberOfQuestionsOptions = [5, 10, 15,20]
    
    @State private var selectedDifficulty = 0
        let difficultyOptions = ["Easy", "Medium", "Hard"]
    
    @State private var selectedTime = 0
        let timeOptions = ["1","3","5","10","15","20"]
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text("Quiz Settings ⚙️").fontWeight(.black).font(.system(size: 40)).multilineTextAlignment(.center).padding(.top,50).foregroundColor(.blue).animation(Animation.easeOut(duration: 0.5).delay(0))
            
            HStack {
                
                Text("Topic :").fontWeight(.black)
                
                Picker("Select an Option", selection: $selectedTopic) {
                                        ForEach(0..<topicOptions.count, id: \.self) { index in
                                            Text(topicOptions[index]).tag(index)
                                        }
                                    }
                .pickerStyle(MenuPickerStyle()).background(.white).cornerRadius(5).shadow(radius: 1)

            }.padding(.top,20).animation(Animation.easeOut(duration: 0.5).delay(0.05))
            
            HStack {
                
                Text("Number of Questions :").fontWeight(.black)
                
                Picker("Select an Option", selection: $selectedNumberOfQuestion) {
                                        ForEach(0..<numberOfQuestionsOptions.count, id: \.self) { index in
                                            Text("\(numberOfQuestionsOptions[index])").tag(index)
                                        }
                                    }
                .pickerStyle(MenuPickerStyle()).background(.white).cornerRadius(5).shadow(radius: 1)

            }.padding(.top,20).animation(Animation.easeOut(duration: 0.5).delay(0.1))
            
            HStack {
                
                Text("Difficulty :").fontWeight(.black)
                
                Picker("Select an Option", selection: $selectedDifficulty) {
                                        ForEach(0..<difficultyOptions.count, id: \.self) { index in
                                            Text(difficultyOptions[index]).tag(index)
                                        }
                                    }
                .pickerStyle(MenuPickerStyle()).background(.white).cornerRadius(5).shadow(radius: 1)

            }.padding(.top,20).animation(Animation.easeOut(duration: 0.5).delay(0.15))
            
            HStack {
                
                Text("Timer :").fontWeight(.black)
                
                Picker("Select an Option", selection: $selectedTime) {
                                        ForEach(0..<timeOptions.count, id: \.self) { index in
                                            Text(timeOptions[index]).tag(index)
                                        }
                                    }
                .pickerStyle(MenuPickerStyle()).background(.white).cornerRadius(5).shadow(radius: 1)

            }.padding(.top,20).animation(Animation.easeOut(duration: 0.5).delay(0.2))
            
            Button("Start Quiz ❕"){
                page = "startquiz"
                QVM.quiz = Quiz()
                QVM.quiz.topic = topicOptions[selectedTopic]
                QVM.quiz.difficulty = difficultyOptions[selectedDifficulty]
                QVM.quiz.numOfQuestion = numberOfQuestionsOptions[selectedNumberOfQuestion]
                QVM.quiz.Timer = Int(timeOptions[selectedTime]) ?? 0
                isQuizStarted = true
                QVM.getQuiz()
            }.frame(width: 150, height: 50)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(50)
                .fontWeight(.black)
                .padding(.vertical,40)
                .animation(Animation.easeOut(duration: 0.5).delay(0.25))
                .shadow(radius: 5)
        }
    }
}
