//
//  Quiz Result Model.swift
//  AlgoQuizTrivia
//
//  Created by macuser on 2023-11-21.
//

import Foundation
import SwiftUI

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
