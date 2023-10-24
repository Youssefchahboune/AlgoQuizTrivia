//
//  ContentView.swift
//  AlgoQuizTrivia
//
//  Created by macuser on 2023-10-18.
//

import SwiftUI

struct Question{
    var questionNum: Int
    var questionText: String
    var answer : String
    var options : [String]
}

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

struct Quiz {
    var quizName:String = ""
    var questions : [Question] = []
    var numOfQuestion : Int = 0
    var topic : String = ""
    var difficulty : String = ""
    var Timer : String = ""
    var grade : Int = 0
    var DateAndTime : Date = Date()
}

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

struct QuizResultModel : Hashable {
    var id : UUID = UUID()
    var quizName : String
    var topic : String
    var gradeInPercentage : Int
    var gradeOutOfTotalNumberOfQuestion : String
    var totalNumberOfQuestion : Int
    var difficulty : String
    // var Time : Double
    var dateAndTime : Date
}

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
            }.padding(.horizontal).padding(.bottom)
            
            Text("Date&Time : \(quizResult.dateAndTime.formatted())").padding(.horizontal).opacity(50)

        }.frame(width: 300,height: 200).background(.white).shadow(radius: 1).padding(.bottom,20)
    }
}

class QuizResultViewModel : ObservableObject {
    @Published var listOfResults : [QuizResultModel] = [QuizResultModel(quizName: "Test 1", topic: "Java", gradeInPercentage: 100, gradeOutOfTotalNumberOfQuestion: "10/10", totalNumberOfQuestion: 10, difficulty: "Hard", dateAndTime: Date()),QuizResultModel(quizName: "Test 2", topic: "HTML", gradeInPercentage: 90, gradeOutOfTotalNumberOfQuestion: "18/20", totalNumberOfQuestion: 20, difficulty: "Medium", dateAndTime: Date())]
    
    
    func SaveQuizResult(quiz:Quiz){
        
        let newQuizSaved = QuizResultModel(quizName: quiz.quizName,topic: quiz.topic, gradeInPercentage: quiz.grade, gradeOutOfTotalNumberOfQuestion: "\(0)/\(quiz.questions.count)", totalNumberOfQuestion: quiz.questions.count, difficulty: quiz.difficulty, dateAndTime: quiz.DateAndTime)
        
        listOfResults.append(newQuizSaved)
    }
}

struct NavBar: View {
    @Binding var page: String
    @Binding var isQuizStarted : Bool
    @State private var isMenuVisible = false
    @State private var menuHeight: CGFloat = 0.0

    var body: some View {
        VStack(alignment: .leading,spacing: 0) {
            HStack {
                Text("AlgoQuiz").foregroundColor(.white).padding(.leading, 20).fontWeight(.black)
                Spacer()
                Button(action: {
                        withAnimation {
                            isMenuVisible.toggle()
                            if isMenuVisible && isQuizStarted {
                                menuHeight = 65.0
                            } else if isMenuVisible {
                                menuHeight = 100.0
                            }
                            else {
                                menuHeight = 0.0
                            }
                        }
                    }) {
                        Image("HamburgerIcon").resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.blue)
                            .padding(.trailing, 20)
                    }
            }.frame(height: 70).background(Color.blue)
                ZStack(alignment: .leading) {
                    Rectangle()
                        .frame(height: menuHeight)
                        .foregroundColor(.blue)
                        .animation(.easeInOut(duration: 0.4))
                    if isMenuVisible {
                        VStack(alignment: .leading, spacing: 10) {
                            
                            if !isQuizStarted {
                                Button("Quiz") {
                                    page = "quizpage"
                                    isMenuVisible = false
                                    menuHeight = 0.0
                                }.fontWeight(.heavy)
                                    .disabled(!isMenuVisible)
                                Button("Results") {
                                    page = "resultpage"
                                    isMenuVisible = false
                                    menuHeight = 0.0
                                }.fontWeight(.heavy)
                                .disabled(!isMenuVisible)
                            } else {
                                Button("Quit") {
                                    page = "quizpage"
                                    isQuizStarted = false
                                    isMenuVisible = false
                                    menuHeight = 0.0
                                }.fontWeight(.heavy)
                                .disabled(!isMenuVisible)
                            }
                        }.foregroundColor(.white)
                            .padding(.leading,20)
                            .opacity(isMenuVisible ? 1.0 : 0.0)
                    }
                }
        }
    }
}

struct ContentView: View {
    
    @State var page = "quizpage"
    
    @State var isQuizStarted : Bool = false
    
    @ObservedObject var QVM : QuizViewModel = QuizViewModel()
    @ObservedObject var QRVM : QuizResultViewModel = QuizResultViewModel()
    
    var body: some View {
        
        ZStack(alignment: .center){
//            LinearGradient(gradient: Gradient(colors: [Color.purple,Color.white]), startPoint: .top, endPoint: .center).zIndex(0)
            
            VStack(alignment: .center,spacing: 0){
                NavBar(page : $page , isQuizStarted: $isQuizStarted)
                if page == "quizpage"{
                    QuizPage(page: $page)
                }else if page == "quizsettings"{
                    QuizSettingsPage(page: $page,isQuizStarted: $isQuizStarted, QVM: QVM)
                } else if page == "startquiz" {
                    QuizStart(isQuizStarted: $isQuizStarted,page: $page)
                } else if page == "savequizpage"{
                    SaveQuizResults(quiz: QVM.quiz, page: $page,QRVM: QRVM)
                } else if page == "resultpage" {
                    ResultsPage(QRVM: QRVM)
                }
            }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading).zIndex(1)
        }
    }
}

struct QuizPage: View {
    @State private var isTextVisible = false
    @Binding var page : String
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            if isTextVisible {
                Image("top icon")
                    .resizable()
                    .frame(width: 200,height: 200)
                    .padding(.vertical, 20)
                    .animation(Animation.easeOut(duration: 0.5))
                
                Text("AlgoQuiz Trivia")
                    .padding(.horizontal)
                    .foregroundColor(.blue)
                    .fontWeight(.black)
                    .font(.system(size: 40))
                    .multilineTextAlignment(.center)
                    .animation(Animation.easeOut(duration: 0.5).delay(0.05))
                
                Text("AlgoQuiz is your gateway to testing your knowledge across a wide range of technologies and topics.")
                    .fontWeight(.light)
                    .padding(.top,40)
                    .padding(.horizontal)
                    .multilineTextAlignment(.center)
                    .animation(Animation.easeOut(duration: 0.5).delay(0.1))
            
                VStack {
                    Button("Take Quiz ❕") {
                        page = "quizsettings"
                    }.frame(width: 150, height: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(50)
                        .fontWeight(.black)
                        .padding(.vertical,40)
                        .animation(Animation.easeOut(duration: 0.5).delay(0.15))
                        .shadow(radius: 5)
                }
            }
        }
        .padding(.top,50)
        .onAppear {
            withAnimation {
                isTextVisible = true
            }
        }
    }
}


struct QuizSettingsPage : View {
    @Binding var page : String
    @Binding var isQuizStarted : Bool
    @ObservedObject var QVM : QuizViewModel
    
    @State private var selectedTopic = 0
        let topicOptions = ["HTML", "Java", "JavaScript"]
    
    @State private var selectedNumberOfQuestion = 0
        let numberOfQuestionsOptions = [5, 10, 15,20]
    
    @State private var selectedDifficulty = 0
        let difficultyOptions = ["Easy", "Medium", "Hard"]
    
    @State private var selectedTime = 0
        let timeOptions = ["5", "10","15","20"]
    
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
                QVM.quiz.topic = topicOptions[selectedTopic]
                QVM.quiz.difficulty = difficultyOptions[selectedDifficulty]
                QVM.quiz.numOfQuestion = numberOfQuestionsOptions[selectedNumberOfQuestion]
                isQuizStarted = true
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

struct QuizStart : View {
    
    @ObservedObject var QVM : QuizViewModel = QuizViewModel()
    @Binding var isQuizStarted : Bool
    @Binding var page : String
    
    @State private var timeRemaining = 10 // Set your initial time in seconds
    @State private var timer: Timer? = nil
    
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 0) {
            VStack {
                    Text("Timer ⏳ : \(timeRemaining)")
                    .font(.title3)
                            .onAppear {
                                // Start the timer when the view appears
                                timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                                    if timeRemaining > 0 {
                                        timeRemaining -= 1
                                    } else {
                                        timer?.invalidate()
                                        //page = "savequizpage"
                                    }
                                }
                            }
            }.padding(.bottom).padding(.top,10).padding(.bottom,10)
            
            QuestionView(question: QVM.quiz.questions[QVM.currentQuestionIndex])
            
            if QVM.currentQuestionIndex+1 == QVM.quiz.questions.count{
                
                    Button("Finish"){
                        // compute quize grade and set the quiz grade
                        isQuizStarted = false
                        page = "savequizpage"// go to save quiz page
                    }.frame(width: 150, height: 50)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(50)
                    .fontWeight(.black)
                    .padding(.vertical,30)
                    .animation(Animation.easeOut(duration: 0.5).delay(0.15))
                    .shadow(radius: 5)
            } else {
                
                    Button("Next"){
                        QVM.Next()
                    }.frame(width: 150, height: 50)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(50)
                    .fontWeight(.black)
                    .padding(.vertical,30)
                    .animation(Animation.easeOut(duration: 0.5).delay(0.15))
                    .shadow(radius: 5)
            }
            
        }.padding(.top, 30)
    }
}

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
            
            Text("\(Int(quiz.grade))%").fontWeight(.black).padding(.top).font(.system(size: 50)).padding(.bottom,20)
            
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


struct ResultsPage : View {
    
    @ObservedObject var QRVM : QuizResultViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Result page").fontWeight(.black).font(.system(size: 35)).multilineTextAlignment(.center).padding(.top,30).foregroundColor(.blue).padding(.bottom,20).padding(.leading,15)
            
            ScrollView {
                VStack {
                    ForEach(QRVM.listOfResults, id: \.self) { quizResult in
                        QuizResultView(quizResult: quizResult).padding(.horizontal)
                    }
                }.padding(.top)
            }
            
        }.padding(.top,30).frame(maxWidth: .infinity)
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
