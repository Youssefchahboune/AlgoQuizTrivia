//
//  Results Page.swift
//  AlgoQuizTrivia
//
//  Created by macuser on 2023-11-21.
//

import Foundation
import SwiftUI

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
