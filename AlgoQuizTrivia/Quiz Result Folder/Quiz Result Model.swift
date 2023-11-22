//
//  Quiz Result Model.swift
//  AlgoQuizTrivia
//
//  Created by macuser on 2023-11-21.
//

import Foundation
import SwiftUI

struct QuizResultModel : Hashable , Codable, Identifiable{
    var id : String
    var quizName : String
    var topic : String
    var gradeInPercentage : String
    var gradeOutOfTotalNumberOfQuestion : String
    var totalNumberOfQuestion : String
    var difficulty : String
    var TimeLeft : String
    var dateAndTime : String
}
