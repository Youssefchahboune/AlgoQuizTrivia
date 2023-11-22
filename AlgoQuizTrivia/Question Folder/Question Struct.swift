//
//  Question Struct.swift
//  AlgoQuizTrivia
//
//  Created by macuser on 2023-11-21.
//

import Foundation
import SwiftUI

struct ApiQuestion : Codable {
    var id : Int = 0
    var question : String = ""
    var answers : AnswerChoice = AnswerChoice()
    var correct_answers : CorrectAnswer = CorrectAnswer()
}

struct AnswerChoice : Codable {
    var answer_a : String = ""
    var answer_b : String = ""
    var answer_c : String = ""
    var answer_d : String = ""
}

struct CorrectAnswer : Codable {
    var answer_a_correct : String = ""
    var answer_b_correct : String = ""
    var answer_c_correct : String = ""
    var answer_d_correct : String = ""
}

