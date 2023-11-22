//
//  Quiz Result View Model.swift
//  AlgoQuizTrivia
//
//  Created by macuser on 2023-11-21.
//

import Foundation
import SwiftUI
import FirebaseCore
import FirebaseFirestore



class QuizResultViewModel : ObservableObject {
    @Published var listOfResults : [QuizResultModel] = []
    
    
    func SaveQuizResult(quiz:Quiz){
        
        let db = Firestore.firestore()
        
        var ref : DocumentReference? = nil
        
        let uuid : String = UUID().uuidString
        
        ref = db.collection("Results").addDocument(data: [
            "id" : uuid,
            "quizName": quiz.quizName,
            "topic" : quiz.topic ,
            "gradeInPercentage" : "\(((quiz.grade * 100 ) / quiz.numOfQuestion))" ,
            "gradeOutOfTotalNumberOfQuestion" : "\(quiz.grade)/\(quiz.numOfQuestion)" ,
            "totalNumberOfQuestion" : "\(quiz.numOfQuestion)" ,
            "difficulty" : quiz.difficulty ,
            "TimeLeft" : quiz.timerString,
            "dateAndTime" : quiz.DateAndTime
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with Id : \(ref!.documentID)")
            }
            
        }
        
    }
    
    func fetchQuizResults() {
        
        let db = Firestore.firestore()
        
        db.collection("Results").getDocuments { querySnapshot, error in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                }
                
                // Parse the documents into QuizResultModel objects
                let results = querySnapshot!.documents.compactMap { document in
                    try? document.data(as: QuizResultModel.self)
                }
                
                DispatchQueue.main.async {
                    self.listOfResults = results
                }
            }
        }
    }
    
    func deleteQuizResult(id : String) {
        let db = Firestore.firestore()

        // Create a query to find the document with the specified field value
        let query = db.collection("Results").whereField("id", isEqualTo: id)

        // Execute the query
        query.getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                // Check if there are matching documents
                if let documents = querySnapshot?.documents {
                    for document in documents {
                        // Delete each matching document
                        db.collection("Results").document(document.documentID).delete { error in
                            if let error = error {
                                print("Error deleting document: \(error)")
                            } else {
                                print("Document successfully deleted")
                            }
                        }
                    }
                }
            }
        }
        
        if let index = self.listOfResults.firstIndex(where: { $0.id == id }) {
            self.listOfResults.remove(at: index)
        }
        
    }
}
