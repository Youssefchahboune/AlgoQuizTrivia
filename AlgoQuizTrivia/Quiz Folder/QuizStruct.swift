//
//  QuizStruct.swift
//  AlgoQuizTrivia
//
//  Created by macuser on 2023-11-21.
//

import Foundation
import SwiftUI

struct Quiz {
    var quizName:String = ""
    var numOfQuestion : Int = 0
    var topic : String = ""
    var difficulty : String = ""
    var Timer : Int = 0
    var timerString : String = ""
    var grade : Int = 0
    var DateAndTime : Date = Date()
}
