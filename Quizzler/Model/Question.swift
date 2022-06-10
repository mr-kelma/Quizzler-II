//
//  Question.swift
//  Quizzler
//
//  Created by Valery Keplin on 9.06.22.
//

import UIKit

struct Question {
    let text: String
    var answer: [String]
    var correctAnswer: String
    
    init(q: String, a: [String], ca: String) {
        text = q
        answer = a
        correctAnswer = ca
    }
}
