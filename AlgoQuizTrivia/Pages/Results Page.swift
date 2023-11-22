//
//  Results Page.swift
//  AlgoQuizTrivia
//
//  Created by macuser on 2023-11-21.
//

import Foundation
import SwiftUI
import FirebaseCore
import FirebaseFirestore

struct ResultsPage : View {
    
    @ObservedObject var QRVM : QuizResultViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Result page").fontWeight(.black).font(.system(size: 35)).padding(.top,30).foregroundColor(.blue).padding(.bottom,20)
            
            ScrollView {
                VStack {
                    
                    if(QRVM.listOfResults.isEmpty){
                        Spacer()
                        Text("🔎 No Test Result Saved").padding(.top,30).opacity(0.2)
                        Spacer()
                    }else {
                        ForEach(QRVM.listOfResults) { quizResult in
                            QuizResultView(quizResult: quizResult, QRVM: QRVM).padding(.horizontal)
                        }
                    }
                }
                .padding(.top)
                .onAppear {
                    // Fetch quiz results from Firestore when the view appears
                    QRVM.fetchQuizResults()
                }
            }
            
        }.padding(.top,30).frame(maxWidth: .infinity)
    }
}
